const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb

const Usuario = {
  // Función para crear un nuevo usuario
  crear: async (data) => {
    const { Nombre_Usuario, Correo, Contraseña, Rol, Telefono } = data;
    const query = `
      INSERT INTO Usuarios (Nombre_Usuario, Correo, Contraseña, Rol, Telefono)
      VALUES (:Nombre_Usuario, :Correo, :Contraseña, :Rol, :Telefono)
    `;
    const binds = { Nombre_Usuario, Correo, Contraseña, Rol, Telefono };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Usuario creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el usuario: ' + err.message);
    }
  },

  // Función para obtener todos los usuarios
  obtenerTodos: async () => {
    const query = `SELECT * FROM Usuarios`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los usuarios: ' + err.message);
    }
  },

// Función para actualizar un usuario
actualizar: async (data) => {
	const { Usuario_ID, Nombre_Usuario, Correo, Contraseña, Rol, Telefono } = data;
	const query = `
	  UPDATE Usuarios
	  SET Nombre_Usuario = :Nombre_Usuario,
		  Correo = :Correo,
		  Contraseña = :Contraseña,
		  Rol = :Rol,
		  Telefono = :Telefono
	  WHERE Usuario_ID = :Usuario_ID
	`;
	const binds = { Usuario_ID, Nombre_Usuario, Correo, Contraseña, Rol, Telefono };
	
	try {
	  // Ejecutar la consulta de actualización con autoCommit: true
	  await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
	  return { message: 'Usuario actualizado con éxito' };
	} catch (err) {
	  throw new Error('Error al actualizar el usuario: ' + err.message);
	}
  },
  

  // Función para eliminar un usuario
  eliminar: async (Usuario_ID) => {
    const query = `DELETE FROM Usuarios WHERE Usuario_ID = :Usuario_ID`;
    const binds = { Usuario_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Usuario eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el usuario: ' + err.message);
    }
  }
};

module.exports = Usuario;
