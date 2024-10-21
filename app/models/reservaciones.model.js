const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb
const oracledb = require('oracledb'); // Asegúrate de importar oracledb

const Reservacion = {
  crear: async (data) => {
    const { Mascota_ID, Habitacion_ID, FECHA_ENTRADA, FECHA_SALIDA, TOTAL, NOTAS } = data;
    const Estado = 'Pendiente'; // Estado por defecto

    // Convertimos el Total de string a número decimal con coma
    const TotalFormateado = parseFloat(TOTAL.replace(',', '.'));

    // Ajustamos el formato de las fechas para que Oracle las interprete correctamente
    const query = `
      INSERT INTO Reservaciones (Mascota_ID, Habitacion_ID, Fecha_Entrada, Fecha_Salida, Estado, Total, Notas)
      VALUES (:Mascota_ID, :Habitacion_ID, TO_TIMESTAMP(:FECHA_ENTRADA, 'DD/MM/YY HH24:MI:SS'), TO_TIMESTAMP(:FECHA_SALIDA, 'DD/MM/YY HH24:MI:SS'), :Estado, :Total, :Notas)
      RETURNING Reservacion_ID INTO :Reservacion_ID
    `;
    const binds = {
      Mascota_ID,
      Habitacion_ID,
      FECHA_ENTRADA: FECHA_ENTRADA.split(',')[0], // Eliminamos la fracción de segundos
      FECHA_SALIDA: FECHA_SALIDA.split(',')[0],   // Eliminamos la fracción de segundos
      Estado,
      Total: TotalFormateado,  // Total convertido a número decimal
      Notas: NOTAS,
      Reservacion_ID: { type: oracledb.NUMBER, dir: oracledb.BIND_OUT } // Reservacion_ID será devuelto
    };

    try {
      const result = await db.executeQuery(query, binds, { autoCommit: true });
      console.log('Reservacion_ID devuelto:', result.outBinds.Reservacion_ID[0]); // Imprimir en consola
      return { Reservacion_ID: result.outBinds.Reservacion_ID[0], message: 'Reservación creada con éxito' };
    } catch (err) {
      throw new Error('Error al crear la reservación: ' + err.message);
    }
  },



  // Función para obtener todas las reservaciones
  obtenerTodos: async () => {
    const query = `SELECT * FROM Reservaciones`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener las reservaciones: ' + err.message);
    }
  },


 // Modificación en el método obtenerPorUsuario
obtenerPorUsuario: async (id_usuario) => {
  const query = `
    SELECT 
        r.RESERVACION_ID,
        r.FECHA_ENTRADA,
        r.FECHA_SALIDA,
        r.ESTADO,
        r.TOTAL,
        r.NOTAS,
        h.NOMBRE_HABITACION,
        h.ESTADO AS ESTADO_HABITACION,
        h.CAPACIDAD_MAXIMA,
        h.TIPO_HABITACION,
        h.UBICACION,
        h.DESCRIPCION,
        h.PRECIO_BASE,
        h.IMAGENES,  -- Agregar las imágenes de la habitación
        m.NOMBRE_MASCOTA,
        m.ESPECIE,
        m.RAZA,
        m.PESO,
        m.EDAD,
        m.SEXO,
        m.FOTO,  -- Agregar la foto de la mascota
        s.NOMBRE_SERVICIO,
        s.DESCRIPCION AS DESCRIPCION_SERVICIO,
        s.DURACION AS DURACION_SERVICIO,
        sr.CANTIDAD,
        sr.PRECIO AS PRECIO_SERVICIO
    FROM 
        PET_HEAVEN.RESERVACIONES r
    JOIN 
        PET_HEAVEN.HABITACIONES h ON r.HABITACION_ID = h.HABITACION_ID
    JOIN 
        PET_HEAVEN.MASCOTAS m ON r.MASCOTA_ID = m.MASCOTA_ID
    LEFT JOIN 
        PET_HEAVEN.SERVICIOS_RESERVACIONES sr ON r.RESERVACION_ID = sr.RESERVACION_ID
    LEFT JOIN 
        PET_HEAVEN.SERVICIOS s ON sr.SERVICIO_ID = s.SERVICIO_ID
    WHERE 
        r.FECHA_SALIDA >= CURRENT_DATE
    AND 
        m.PROPIETARIO_ID = :id_usuario
    ORDER BY 
        r.FECHA_ENTRADA ASC`;

  let connection;

  try {
    connection = await oracledb.getConnection();  // Obtener la conexión a la base de datos
    const result = await connection.execute(query, [id_usuario], {
      fetchArraySize: 100, // Ajusta el tamaño de los lotes si es necesario
      outFormat: oracledb.OBJECT // Formato de salida para tener los nombres de las columnas
    });

    // Leer los CLOBs de las imágenes de las habitaciones y devolver los datos procesados
    const reservas = await Promise.all(result.rows.map(async (row) => {
      const reserva = {
        RESERVACION_ID: row.RESERVACION_ID,
        FECHA_ENTRADA: row.FECHA_ENTRADA,
        FECHA_SALIDA: row.FECHA_SALIDA,
        ESTADO: row.ESTADO,
        TOTAL: row.TOTAL,
        NOTAS: row.NOTAS,
        NOMBRE_HABITACION: row.NOMBRE_HABITACION,
        ESTADO_HABITACION: row.ESTADO_HABITACION,
        CAPACIDAD_MAXIMA: row.CAPACIDAD_MAXIMA,
        TIPO_HABITACION: row.TIPO_HABITACION,
        UBICACION: row.UBICACION,
        DESCRIPCION: row.DESCRIPCION,
        PRECIO_BASE: row.PRECIO_BASE,
        IMAGENES: null,  // Inicializar el campo de la imagen como null
        NOMBRE_MASCOTA: row.NOMBRE_MASCOTA,
        ESPECIE: row.ESPECIE,
        RAZA: row.RAZA,
        PESO: row.PESO,
        EDAD: row.EDAD,
        SEXO: row.SEXO,
        FOTO: row.FOTO,  // Foto de la mascota
        NOMBRE_SERVICIO: row.NOMBRE_SERVICIO,
        DESCRIPCION_SERVICIO: row.DESCRIPCION_SERVICIO,
        DURACION_SERVICIO: row.DURACION_SERVICIO,
        CANTIDAD: row.CANTIDAD,
        PRECIO_SERVICIO: row.PRECIO_SERVICIO
      };

      // Leer el CLOB de `IMAGENES` para la habitación si existe
      if (row.IMAGENES && row.IMAGENES instanceof oracledb.Lob) {
        reserva.IMAGENES = await readLob(row.IMAGENES);  // Convertir el LOB en una cadena
      }

      return reserva;
    }));

    return reservas;  // Retornar el array de reservas procesado
  } catch (err) {
    throw new Error('Error al obtener las reservaciones por usuario: ' + err.message);
  } finally {
    if (connection) {
      try {
        await connection.close();  // Asegurarse de cerrar la conexión
      } catch (err) {
        console.error('Error al cerrar la conexión:', err);
      }
    }
  }
},


obtenerHistorialPorUsuario: async (id_usuario) => {
  const query = `
    SELECT 
        r.RESERVACION_ID,
        r.FECHA_ENTRADA,
        r.FECHA_SALIDA,
        r.ESTADO,
        r.TOTAL,
        r.NOTAS,
        h.NOMBRE_HABITACION,
        h.ESTADO AS ESTADO_HABITACION,
        h.CAPACIDAD_MAXIMA,
        h.TIPO_HABITACION,
        h.UBICACION,
        h.DESCRIPCION,
        h.PRECIO_BASE,
        h.IMAGENES,  -- Obtener las imágenes de la habitación
        m.NOMBRE_MASCOTA,
        m.ESPECIE,
        m.RAZA,
        m.PESO,
        m.EDAD,
        m.SEXO,
        m.FOTO,  -- Obtener la foto de la mascota
        s.NOMBRE_SERVICIO,
        s.DESCRIPCION AS DESCRIPCION_SERVICIO,
        s.DURACION AS DURACION_SERVICIO,
        sr.CANTIDAD,
        sr.PRECIO AS PRECIO_SERVICIO
    FROM 
        PET_HEAVEN.RESERVACIONES r
    JOIN 
        PET_HEAVEN.HABITACIONES h ON r.HABITACION_ID = h.HABITACION_ID
    JOIN 
        PET_HEAVEN.MASCOTAS m ON r.MASCOTA_ID = m.MASCOTA_ID
    LEFT JOIN 
        PET_HEAVEN.SERVICIOS_RESERVACIONES sr ON r.RESERVACION_ID = sr.RESERVACION_ID
    LEFT JOIN 
        PET_HEAVEN.SERVICIOS s ON sr.SERVICIO_ID = s.SERVICIO_ID
    WHERE 
        r.FECHA_SALIDA < CURRENT_DATE  -- Historial: las reservas cuyo FECHA_SALIDA ya pasó
    AND 
        m.PROPIETARIO_ID = :id_usuario
    ORDER BY 
        r.FECHA_ENTRADA ASC`;

  let connection;

  try {
    connection = await oracledb.getConnection();
    const result = await connection.execute(query, [id_usuario], {
      fetchArraySize: 100,
      outFormat: oracledb.OBJECT
    });

    const reservas = await Promise.all(result.rows.map(async (row) => {
      const reserva = {
        RESERVACION_ID: row.RESERVACION_ID,
        FECHA_ENTRADA: row.FECHA_ENTRADA,
        FECHA_SALIDA: row.FECHA_SALIDA,
        ESTADO: row.ESTADO,
        TOTAL: row.TOTAL,
        NOTAS: row.NOTAS,
        NOMBRE_HABITACION: row.NOMBRE_HABITACION,
        ESTADO_HABITACION: row.ESTADO_HABITACION,
        CAPACIDAD_MAXIMA: row.CAPACIDAD_MAXIMA,
        TIPO_HABITACION: row.TIPO_HABITACION,
        UBICACION: row.UBICACION,
        DESCRIPCION: row.DESCRIPCION,
        PRECIO_BASE: row.PRECIO_BASE,
        IMAGENES: null,
        NOMBRE_MASCOTA: row.NOMBRE_MASCOTA,
        ESPECIE: row.ESPECIE,
        RAZA: row.RAZA,
        PESO: row.PESO,
        EDAD: row.EDAD,
        SEXO: row.SEXO,
        FOTO: row.FOTO,
        NOMBRE_SERVICIO: row.NOMBRE_SERVICIO,
        DESCRIPCION_SERVICIO: row.DESCRIPCION_SERVICIO,
        DURACION_SERVICIO: row.DURACION_SERVICIO,
        CANTIDAD: row.CANTIDAD,
        PRECIO_SERVICIO: row.PRECIO_SERVICIO
      };

      if (row.IMAGENES && row.IMAGENES instanceof oracledb.Lob) {
        reserva.IMAGENES = await readLob(row.IMAGENES);
      }

      return reserva;
    }));

    return reservas;
  } catch (err) {
    throw new Error('Error al obtener el historial de reservaciones: ' + err.message);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error('Error al cerrar la conexión:', err);
      }
    }
  }
},


  // Función para actualizar una reservación
  actualizar: async (data) => {
    const { Reservacion_ID, Mascota_ID, Habitacion_ID, Fecha_Entrada, Fecha_Salida, Estado_Reservacion, Total, Notas } = data;
    const query = `
      UPDATE Reservaciones
      SET Mascota_ID = :Mascota_ID,
          Habitacion_ID = :Habitacion_ID,
          Fecha_Entrada = :Fecha_Entrada,
          Fecha_Salida = :Fecha_Salida,
          Estado_Reservacion = :Estado_Reservacion,
          Total = :Total,
          Notas = :Notas
      WHERE Reservacion_ID = :Reservacion_ID
    `;
    const binds = { Reservacion_ID, Mascota_ID, Habitacion_ID, Fecha_Entrada, Fecha_Salida, Estado_Reservacion, Total, Notas };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Reservación actualizada con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar la reservación: ' + err.message);
    }
  },

  // Función para eliminar una reservación
  eliminar: async (Reservacion_ID) => {
    const query = `DELETE FROM Reservaciones WHERE Reservacion_ID = :Reservacion_ID`;
    const binds = { Reservacion_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Reservación eliminada con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar la reservación: ' + err.message);
    }
  }
};


// Función auxiliar para leer un CLOB (como ya tienes)
async function readLob(lob) {
  return new Promise((resolve, reject) => {
    let data = '';
    lob.setEncoding('utf8');  // Establecer la codificación
    lob.on('data', chunk => {
      data += chunk;  // Concatenar los chunks de datos
    });
    lob.on('end', () => {
      resolve(data);  // Devolver los datos cuando finalice
    });
    lob.on('error', err => {
      reject(err);  // Manejar errores
    });
  });
}

module.exports = Reservacion;
