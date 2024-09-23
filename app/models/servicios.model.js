const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Servicio = {
  // Función para crear un nuevo servicio
  crear: async (data) => {
    const { Nombre_Servicio, Descripcion, Precio, Duracion } = data;
    const query = `
      INSERT INTO Servicios (Nombre_Servicio, Descripcion, Precio, Duracion)
      VALUES (:Nombre_Servicio, :Descripcion, :Precio, :Duracion)
    `;
    const binds = { Nombre_Servicio, Descripcion, Precio, Duracion };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Servicio creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el servicio: ' + err.message);
    }
  },

  // Función para obtener todos los servicios
  obtenerTodos: async () => {
    const query = `select * from servicios`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los servicios: ' + err.message);
    }
  },

  

  // Función para actualizar un servicio
  actualizar: async (data) => {
    const { Servicio_ID, Nombre_Servicio, Descripcion, Precio, Duracion } = data;
    const query = `
      UPDATE Servicios
      SET Nombre_Servicio = :Nombre_Servicio,
          Descripcion = :Descripcion,
          Precio = :Precio,
          Duracion = :Duracion
      WHERE Servicio_ID = :Servicio_ID
    `;
    const binds = { Servicio_ID, Nombre_Servicio, Descripcion, Precio, Duracion };
    
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
