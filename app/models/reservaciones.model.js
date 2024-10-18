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

module.exports = Reservacion;
