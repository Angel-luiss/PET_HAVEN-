const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Precio = {
  // Función para crear un nuevo precio
  crear: async (data) => {
    const { Tipo_Mascota, Tipo_Habitacion, Precio_Diario } = data;
    const query = `
      INSERT INTO Precios (Tipo_Mascota, Tipo_Habitacion, Precio_Diario)
      VALUES (:Tipo_Mascota, :Tipo_Habitacion, :Precio_Diario)
    `;
    const binds = { Tipo_Mascota, Tipo_Habitacion, Precio_Diario };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Precio creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el precio: ' + err.message);
    }
  },

  // Función para obtener todos los precios
  obtenerTodos: async () => {
    const query = `SELECT * FROM Precios`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los precios: ' + err.message);
    }
  },

  // Función para actualizar un precio
  actualizar: async (data) => {
    const { Precio_ID, Tipo_Mascota, Tipo_Habitacion, Precio_Diario } = data;
    const query = `
      UPDATE Precios
      SET Tipo_Mascota = :Tipo_Mascota,
          Tipo_Habitacion = :Tipo_Habitacion,
          Precio_Diario = :Precio_Diario
      WHERE Precio_ID = :Precio_ID
    `;
    const binds = { Precio_ID, Tipo_Mascota, Tipo_Habitacion, Precio_Diario };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Precio actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el precio: ' + err.message);
    }
  },

  // Función para eliminar un precio
  eliminar: async (Precio_ID) => {
    const query = `DELETE FROM Precios WHERE Precio_ID = :Precio_ID`;
    const binds = { Precio_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Precio eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el precio: ' + err.message);
    }
  }
};

module.exports = Precio;
