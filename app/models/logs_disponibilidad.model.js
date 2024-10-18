const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const LogDisponibilidad = {
  // Función para crear un nuevo registro de disponibilidad
  crear: async (data) => {
    const { Habitacion_ID, Estado, Comentarios } = data;
    const query = `
      INSERT INTO Logs_Disponibilidad (Habitacion_ID, Estado, Comentarios)
      VALUES (:Habitacion_ID, :Estado, :Comentarios)
    `;
    const binds = { Habitacion_ID, Estado, Comentarios };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Log de disponibilidad creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el log de disponibilidad: ' + err.message);
    }
  },

  // Función para obtener todos los logs de disponibilidad
  obtenerTodos: async () => {
    const query = `SELECT * FROM Logs_Disponibilidad`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los logs de disponibilidad: ' + err.message);
    }
  },

  // Función para actualizar un registro de disponibilidad
  actualizar: async (data) => {
    const { Log_ID, Habitacion_ID, Estado, Comentarios } = data;
    const query = `
      UPDATE Logs_Disponibilidad
      SET Habitacion_ID = :Habitacion_ID,
          Estado = :Estado,
          Comentarios = :Comentarios
      WHERE Log_ID = :Log_ID
    `;
    const binds = { Log_ID, Habitacion_ID, Estado, Comentarios };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Log de disponibilidad actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el log de disponibilidad: ' + err.message);
    }
  },

  // Función para eliminar un log de disponibilidad
  eliminar: async (Log_ID) => {
    const query = `DELETE FROM Logs_Disponibilidad WHERE Log_ID = :Log_ID`;
    const binds = { Log_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Log de disponibilidad eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el log de disponibilidad: ' + err.message);
    }
  }
};

module.exports = LogDisponibilidad;
