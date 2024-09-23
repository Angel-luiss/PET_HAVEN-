const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Proveedor = {
  // Función para crear un nuevo proveedor
  crear: async (data) => {
    const { Nombre, Contacto, Direccion } = data;
    const query = `
      INSERT INTO Proveedores (Nombre, Contacto, Direccion)
      VALUES (:Nombre, :Contacto, :Direccion)
    `;
    const binds = { Nombre, Contacto, Direccion };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Proveedor creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el proveedor: ' + err.message);
    }
  },

  // Función para obtener todos los proveedores
  obtenerTodos: async () => {
    const query = `SELECT * FROM Proveedores`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los proveedores: ' + err.message);
    }
  },

  // Función para actualizar un proveedor
  actualizar: async (data) => {
    const { Proveedor_ID, Nombre, Contacto, Direccion } = data;
    const query = `
      UPDATE Proveedores
      SET Nombre = :Nombre,
          Contacto = :Contacto,
          Direccion = :Direccion
      WHERE Proveedor_ID = :Proveedor_ID
    `;
    const binds = { Proveedor_ID, Nombre, Contacto, Direccion };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Proveedor actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el proveedor: ' + err.message);
    }
  },

  // Función para eliminar un proveedor
  eliminar: async (Proveedor_ID) => {
    const query = `DELETE FROM Proveedores WHERE Proveedor_ID = :Proveedor_ID`;
    const binds = { Proveedor_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Proveedor eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el proveedor: ' + err.message);
    }
  }
};

module.exports = Proveedor;
