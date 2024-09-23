const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const ServicioReservacion = {
  // Función para crear una nueva entrada de servicio de reservación
  crear: async (data) => {
    const { Reservacion_ID, Servicio_ID, Cantidad, Precio } = data;
    const query = `
      INSERT INTO Servicios_Reservacion (Reservacion_ID, Servicio_ID, Cantidad, Precio)
      VALUES (:Reservacion_ID, :Servicio_ID, :Cantidad, :Precio)
    `;
    const binds = { Reservacion_ID, Servicio_ID, Cantidad, Precio };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Servicio de reservación creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el servicio de reservación: ' + err.message);
    }
  },

  // Función para obtener todos los servicios de reservación
  obtenerTodos: async () => {
    const query = `SELECT * FROM Servicios_Reservacion`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los servicios de reservación: ' + err.message);
    }
  },

  // Función para actualizar un servicio de reservación
  actualizar: async (data) => {
    const { Servicio_Reservacion_ID, Reservacion_ID, Servicio_ID, Cantidad, Precio } = data;
    const query = `
      UPDATE Servicios_Reservacion
      SET Reservacion_ID = :Reservacion_ID,
          Servicio_ID = :Servicio_ID,
          Cantidad = :Cantidad,
          Precio = :Precio
      WHERE Servicio_Reservacion_ID = :Servicio_Reservacion_ID
    `;
    const binds = { Servicio_Reservacion_ID, Reservacion_ID, Servicio_ID, Cantidad, Precio };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Servicio de reservación actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el servicio de reservación: ' + err.message);
    }
  },

  // Función para eliminar un servicio de reservación
  eliminar: async (Servicio_Reservacion_ID) => {
    const query = `DELETE FROM Servicios_Reservacion WHERE Servicio_Reservacion_ID = :Servicio_Reservacion_ID`;
    const binds = { Servicio_Reservacion_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Servicio de reservación eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el servicio de reservación: ' + err.message);
    }
  }
};

module.exports = ServicioReservacion;
