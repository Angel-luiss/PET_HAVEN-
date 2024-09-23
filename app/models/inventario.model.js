const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Inventario = {
  // Función para crear un nuevo ítem de inventario
  crear: async (data) => {
    const { Nombre_Item, Cantidad, Proveedor } = data;
    const query = `
      INSERT INTO Inventario (Nombre_Item, Cantidad, Proveedor)
      VALUES (:Nombre_Item, :Cantidad, :Proveedor)
    `;
    const binds = { Nombre_Item, Cantidad, Proveedor };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Ítem de inventario creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el ítem de inventario: ' + err.message);
    }
  },

  // Función para obtener todos los ítems de inventario
  obtenerTodos: async () => {
    const query = `SELECT * FROM Inventario`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los ítems de inventario: ' + err.message);
    }
  },

  // Función para actualizar un ítem de inventario
  actualizar: async (data) => {
    const { Inventario_ID, Nombre_Item, Cantidad, Proveedor } = data;
    const query = `
      UPDATE Inventario
      SET Nombre_Item = :Nombre_Item,
          Cantidad = :Cantidad,
          Proveedor = :Proveedor
      WHERE Inventario_ID = :Inventario_ID
    `;
    const binds = { Inventario_ID, Nombre_Item, Cantidad, Proveedor };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Ítem de inventario actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el ítem de inventario: ' + err.message);
    }
  },

  // Función para eliminar un ítem de inventario
  eliminar: async (Inventario_ID) => {
    const query = `DELETE FROM Inventario WHERE Inventario_ID = :Inventario_ID`;
    const binds = { Inventario_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Ítem de inventario eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el ítem de inventario: ' + err.message);
    }
  }
};

module.exports = Inventario;
