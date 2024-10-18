const db = require('../config/db.config.js');  // Archivo que maneja la conexión a oracledb

const Servicio = {
  // Función para crear un nuevo servicio
  crear: async (data) => {
    const { Nombre_Servicio, Descripcion, Precio, Duracion, Tipo } = data;
    const query = `
      INSERT INTO Servicios (Nombre_Servicio, Descripcion, Precio, Duracion, Tipo)
      VALUES (:Nombre_Servicio, :Descripcion, :Precio, :Duracion, :Tipo)
    `;
    const binds = { Nombre_Servicio, Descripcion, Precio, Duracion, Tipo };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegura que la transacción se haga commit
      return { message: 'Servicio creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el servicio: ' + err.message);
    }
  },

  // Función para obtener todos los servicios
  obtenerTodos: async () => {
    const query = `SELECT * FROM Servicios`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas desde la tabla
    } catch (err) {
      throw new Error('Error al obtener los servicios: ' + err.message);
    }
  },

  // Función para obtener un servicio por ID
  obtenerPorId: async (Servicio_ID) => {
    const query = `SELECT * FROM Servicios WHERE Servicio_ID = :Servicio_ID`;
    const binds = { Servicio_ID };

    try {
      const result = await db.executeQuery(query, binds);
      return result.rows[0];  // Devuelve el primer registro
    } catch (err) {
      throw new Error('Error al obtener el servicio: ' + err.message);
    }
  },

  // Función para actualizar un servicio
  actualizar: async (data) => {
    const { Servicio_ID, Nombre_Servicio, Descripcion, Precio, Duracion, Tipo } = data;
    const query = `
      UPDATE Servicios
      SET Nombre_Servicio = :Nombre_Servicio,
          Descripcion = :Descripcion,
          Precio = :Precio,
          Duracion = :Duracion,
          Tipo = :Tipo
      WHERE Servicio_ID = :Servicio_ID
    `;
    const binds = { Servicio_ID, Nombre_Servicio, Descripcion, Precio, Duracion, Tipo };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Servicio actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el servicio: ' + err.message);
    }
  },

  // Función para eliminar un servicio
  eliminar: async (Servicio_ID) => {
    const query = `DELETE FROM Servicios WHERE Servicio_ID = :Servicio_ID`;
    const binds = { Servicio_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Servicio eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el servicio: ' + err.message);
    }
  }
};

module.exports = Servicio;
