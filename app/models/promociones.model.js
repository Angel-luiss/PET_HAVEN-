const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Promocion = {
  // Función para crear una nueva promoción
  crear: async (data) => {
    const { Nombre, Descripcion, Descuento, Fecha_Inicio, Fecha_Fin } = data;
    const query = `
      INSERT INTO Promociones (Nombre, Descripcion, Descuento, Fecha_Inicio, Fecha_Fin)
      VALUES (:Nombre, :Descripcion, :Descuento, :Fecha_Inicio, :Fecha_Fin)
    `;
    const binds = { Nombre, Descripcion, Descuento, Fecha_Inicio, Fecha_Fin };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Promoción creada con éxito' };
    } catch (err) {
      throw new Error('Error al crear la promoción: ' + err.message);
    }
  },

  // Función para obtener todas las promociones
  obtenerTodos: async () => {
    const query = `SELECT * FROM Promociones`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener las promociones: ' + err.message);
    }
  },

  // Función para actualizar una promoción
  actualizar: async (data) => {
    const { Promocion_ID, Nombre, Descripcion, Descuento, Fecha_Inicio, Fecha_Fin } = data;
    const query = `
      UPDATE Promociones
      SET Nombre = :Nombre,
          Descripcion = :Descripcion,
          Descuento = :Descuento,
          Fecha_Inicio = :Fecha_Inicio,
          Fecha_Fin = :Fecha_Fin
      WHERE Promocion_ID = :Promocion_ID
    `;
    const binds = { Promocion_ID, Nombre, Descripcion, Descuento, Fecha_Inicio, Fecha_Fin };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Promoción actualizada con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar la promoción: ' + err.message);
    }
  },

  // Función para eliminar una promoción
  eliminar: async (Promocion_ID) => {
    const query = `DELETE FROM Promociones WHERE Promocion_ID = :Promocion_ID`;
    const binds = { Promocion_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Promoción eliminada con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar la promoción: ' + err.message);
    }
  }
};

module.exports = Promocion;
