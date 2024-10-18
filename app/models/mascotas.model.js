const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Mascota = {
  // Función para crear una nueva mascota
  crear: async (data) => {
    const { Propietario_ID, Nombre_Mascota, Especie, Raza, Peso, Edad, Sexo, Categoria, Foto } = data;
    const query = `
      INSERT INTO Mascotas (Propietario_ID, Nombre_Mascota, Especie, Raza, Peso, Edad, Sexo, Categoria, Foto)
      VALUES (:Propietario_ID, :Nombre_Mascota, :Especie, :Raza, :Peso, :Edad, :Sexo, :Categoria, :Foto)
    `;
    const binds = { Propietario_ID, Nombre_Mascota, Especie, Raza, Peso, Edad, Sexo, Categoria, Foto };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Mascota creada con éxito' };
    } catch (err) {
      throw new Error('Error al crear la mascota: ' + err.message);
    }
  },

  // Función para obtener todas las mascotas de un usuario en específico
  obtenerPorPropietario: async (Propietario_ID) => {
    const query = `SELECT * FROM Mascotas WHERE Propietario_ID = :Propietario_ID`;
    const binds = { Propietario_ID };
    try {
      const result = await db.executeQuery(query, binds);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener las mascotas: ' + err.message);
    }
  },

  // Función para actualizar una mascota
  actualizar: async (data) => {
    const { Mascota_ID, Propietario_ID, Nombre_Mascota, Especie, Raza, Peso, Edad, Sexo, Categoria, Foto } = data;
    const query = `
      UPDATE Mascotas
      SET Propietario_ID = :Propietario_ID,
          Nombre_Mascota = :Nombre_Mascota,
          Especie = :Especie,
          Raza = :Raza,
          Peso = :Peso,
          Edad = :Edad,
          Sexo = :Sexo,
          Categoria = :Categoria,
          Foto = :Foto
      WHERE Mascota_ID = :Mascota_ID
    `;
    const binds = { Mascota_ID, Propietario_ID, Nombre_Mascota, Especie, Raza, Peso, Edad, Sexo, Categoria, Foto };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Mascota actualizada con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar la mascota: ' + err.message);
    }
  },

  
  // Función para eliminar una mascota
  eliminar: async (Mascota_ID) => {
    const query = `DELETE FROM Mascotas WHERE Mascota_ID = :Mascota_ID`;
    const binds = { Mascota_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Mascota eliminada con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar la mascota: ' + err.message);
    }
  }
};

module.exports = Mascota;
