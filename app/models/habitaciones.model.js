const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Habitacion = {
  // Función para crear una nueva habitación
  crear: async (data) => {
    const { Nombre_Habitacion, Estado, Capacidad_Maxima, Tipo_Habitacion, Ubicacion, Descripcion, Precio_Base } = data;
    const query = `
      INSERT INTO Habitaciones (Nombre_Habitacion, Estado, Capacidad_Maxima, Tipo_Habitacion, Ubicacion, Descripcion, Precio_Base)
      VALUES (:Nombre_Habitacion, :Estado, :Capacidad_Maxima, :Tipo_Habitacion, :Ubicacion, :Descripcion, :Precio_Base)
    `;
    const binds = { Nombre_Habitacion, Estado, Capacidad_Maxima, Tipo_Habitacion, Ubicacion, Descripcion, Precio_Base };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Habitación creada con éxito' };
    } catch (err) {
      throw new Error('Error al crear la habitación: ' + err.message);
    }
  },

  // Función para obtener todas las habitaciones
  obtenerTodos: async () => {
    const query = `SELECT * FROM Habitaciones`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener las habitaciones: ' + err.message);
    }
  },

  // Función para actualizar una habitación
  actualizar: async (data) => {
    const { Habitacion_ID, Nombre_Habitacion, Estado, Capacidad_Maxima, Tipo_Habitacion, Ubicacion, Descripcion, Precio_Base } = data;
    const query = `
      UPDATE Habitaciones
      SET Nombre_Habitacion = :Nombre_Habitacion,
          Estado = :Estado,
          Capacidad_Maxima = :Capacidad_Maxima,
          Tipo_Habitacion = :Tipo_Habitacion,
          Ubicacion = :Ubicacion,
          Descripcion = :Descripcion,
          Precio_Base = :Precio_Base
      WHERE Habitacion_ID = :Habitacion_ID
    `;
    const binds = { Habitacion_ID, Nombre_Habitacion, Estado, Capacidad_Maxima, Tipo_Habitacion, Ubicacion, Descripcion, Precio_Base };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
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
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Habitación eliminada con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar la habitación: ' + err.message);
    }
  }
};

module.exports = Habitacion;
