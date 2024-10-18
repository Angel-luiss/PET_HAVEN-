const db = require('../config/db.config.js');  // Conexión a la base de datos Oracle
const oracledb = require('oracledb'); // Importar la librería oracledb


const Habitacion = {
  // Función para crear una nueva habitación
  crear: async (data) => {
    const { 
      Nombre_Habitacion, 
      Estado, 
      Capacidad_Maxima, 
      Tipo_Habitacion, 
      Ubicacion, 
      Descripcion, 
      Precio_Base, 
      Banos_Propios, 
      Cantidad_Camas, 
      Imagenes  // CLOB para almacenar las URLs de las imágenes
    } = data;

    const query = `
      INSERT INTO Habitaciones (
        Nombre_Habitacion, Estado, Capacidad_Maxima, Tipo_Habitacion, Ubicacion, Descripcion, 
        Precio_Base, Banos_Propios, Cantidad_Camas, Imagenes
      ) 
      VALUES (
        :Nombre_Habitacion, :Estado, :Capacidad_Maxima, :Tipo_Habitacion, :Ubicacion, :Descripcion, 
        :Precio_Base, :Banos_Propios, :Cantidad_Camas, :Imagenes
      )
    `;

    const binds = { 
      Nombre_Habitacion, 
      Estado, 
      Capacidad_Maxima, 
      Tipo_Habitacion, 
      Ubicacion, 
      Descripcion, 
      Precio_Base, 
      Banos_Propios, 
      Cantidad_Camas, 
      Imagenes 
    };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Habitación creada con éxito' };
    } catch (err) {
      throw new Error('Error al crear la habitación: ' + err.message);
    }
  },

  // Función para obtener todas las habitaciones
  obtenerTodos: async () => {
    const query = `SELECT * FROM Habitaciones`;
    let connection;

    try {
      connection = await oracledb.getConnection();  // Mantener la conexión activa
      
      // Aumentar el tamaño del fetchArraySize para asegurarnos de traer todas las filas
      const result = await connection.execute(query, [], {
        fetchArraySize: 100 // Ajusta este valor según el número esperado de filas
      });

      console.log(`Número de habitaciones obtenidas: ${result.rows.length}`);  // Para verificar el número de filas obtenidas
      
      const habitaciones = [];

      for (let row of result.rows) {
        const habitacion = {
          Habitacion_ID: row[0],
          Nombre_Habitacion: row[1],
          Estado: row[2],
          Capacidad_Maxima: row[3],
          Tipo_Habitacion: row[4],
          Ubicacion: row[5],
          Descripcion: row[6],
          Precio_Base: row[7],
          Banos_Propios: row[8],
          Cantidad_Camas: row[9],
          Imagenes: null // Inicializar imágenes como null
        };

        // Leer CLOB (si existe) sin cerrar la conexión
        if (row[10] && row[10] instanceof oracledb.Lob) {
          habitacion.Imagenes = await readLob(row[10]);  // Leer el CLOB antes de cerrar la conexión
        }

        habitaciones.push(habitacion);
      }

      return habitaciones;
    } catch (err) {
      console.error('Error al obtener las habitaciones:', err);
      throw err;
    } finally {
      if (connection) {
        try {
          await connection.close();  // Cerrar la conexión solo después de procesar los LOBs
        } catch (err) {
          console.error('Error al cerrar la conexión:', err);
        }
      }
    }
  },

  
  obtenerHabitaciones: async (fechaInicio, fechaFin) => {
    const query = `
      SELECT H.*
      FROM HABITACIONES H
      WHERE H.HABITACION_ID NOT IN (
        SELECT R.HABITACION_ID
        FROM RESERVACIONES R
        WHERE R.ESTADO IN ('completado', 'Pendiente', 'Ocupada')
        AND (
          (TO_TIMESTAMP(:fechaInicio, 'DD/MM/YYYY HH24:MI:SS') < R.FECHA_SALIDA  
           AND TO_TIMESTAMP(:fechaFin, 'DD/MM/YYYY HH24:MI:SS') > R.FECHA_ENTRADA)
        )
      )
    `;

    const binds = { fechaInicio, fechaFin };
    let connection;

    try {
      console.log("Ejecutando consulta con los siguientes valores:");
      console.log("Fecha de Inicio:", fechaInicio);
      console.log("Fecha de Fin:", fechaFin);

      connection = await oracledb.getConnection();  // Obtener conexión a la base de datos
      
      // Ejecutar la consulta
      const result = await connection.execute(query, binds, {
        fetchArraySize: 100 // Ajusta este valor según el número esperado de filas
      });

      console.log(`Número de habitaciones obtenidas: ${result.rows.length}`);  // Para verificar el número de filas obtenidas

      // Procesar las filas y leer los CLOB de las imágenes
      const habitaciones = await Promise.all(result.rows.map(async (row) => {
        const habitacion = {
          Habitacion_ID: row[0],
          Nombre_Habitacion: row[1],
          Estado: row[2],
          Capacidad_Maxima: row[3],
          Tipo_Habitacion: row[4],
          Ubicacion: row[5],
          Descripcion: row[6],
          Precio_Base: row[7],
          Banos_Propios: row[8],
          Cantidad_Camas: row[9],
          Imagenes: null  // Inicializar el campo como null
        };

        // Verificar si el campo `Imagenes` es un LOB y leerlo
        if (row[10] && row[10] instanceof oracledb.Lob) {
          habitacion.Imagenes = await readLob(row[10]);  // Leer el CLOB y convertirlo a cadena
        }

        return habitacion;
      }));

      // Imprimir los resultados procesados de la consulta
      console.log("Resultados procesados de la consulta:", habitaciones);

      return habitaciones;
    } catch (err) {
      console.error('Error al ejecutar la consulta:', err);
      throw err;
    } finally {
      if (connection) {
        try {
          await connection.close();  // Cerrar la conexión solo después de procesar los LOBs
        } catch (err) {
          console.error('Error al cerrar la conexión:', err);
        }
      }
    }
  },
  
  


  // Función para actualizar una habitación
  actualizar: async (data) => {
    const { 
      Habitacion_ID, 
      Nombre_Habitacion, 
      Estado, 
      Capacidad_Maxima, 
      Tipo_Habitacion, 
      Ubicacion, 
      Descripcion, 
      Precio_Base, 
      Banos_Propios, 
      Cantidad_Camas, 
      Imagenes 
    } = data;

    const query = `
      UPDATE Habitaciones
      SET 
        Nombre_Habitacion = :Nombre_Habitacion,
        Estado = :Estado,
        Capacidad_Maxima = :Capacidad_Maxima,
        Tipo_Habitacion = :Tipo_Habitacion,
        Ubicacion = :Ubicacion,
        Descripcion = :Descripcion,
        Precio_Base = :Precio_Base,
        Banos_Propios = :Banos_Propios,
        Cantidad_Camas = :Cantidad_Camas,
        Imagenes = :Imagenes
      WHERE 
        Habitacion_ID = :Habitacion_ID
    `;

    const binds = { 
      Habitacion_ID, 
      Nombre_Habitacion, 
      Estado, 
      Capacidad_Maxima, 
      Tipo_Habitacion, 
      Ubicacion, 
      Descripcion, 
      Precio_Base, 
      Banos_Propios, 
      Cantidad_Camas, 
      Imagenes 
    };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Habitación actualizada con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar la habitación: ' + err.message);
    }
  },

  // Función para eliminar una habitación
  eliminar: async (Habitacion_ID) => {
    const query = `DELETE FROM Habitaciones WHERE Habitacion_ID = :Habitacion_ID`;
    const binds = { Habitacion_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Habitación eliminada con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar la habitación: ' + err.message);
    }
  }
};



// Función auxiliar para leer un CLOB
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


module.exports = Habitacion;
