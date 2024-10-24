const bcrypt = require('bcrypt');
const db = require('../config/db.config.js');

const Usuario = {
  // Función para crear un nuevo usuario con contraseña hasheada o null si es usuario de Google
  crear: async (data) => {
    const { Nombre_Usuario, Correo, Contraseña, Rol, Telefono, Avatar_Url } = data;

    // Verificar si la contraseña fue proporcionada (para usuarios de Google no la proporcionaremos)
    let hashedPassword = null;
    if (Contraseña) {
      hashedPassword = await bcrypt.hash(Contraseña, 10);  // Hasheamos la contraseña
    }

    // Asegurarnos de que los valores opcionales (como avatar o teléfono) manejen valores nulos
    const query = `
      INSERT INTO Usuarios (NOMBRE_USUARIO, CORREO, CONTRASEÑA, ROL, TELEFONO, AVATAR_URL)
      VALUES (:Nombre_Usuario, :Correo, :Contraseña, :Rol, :Telefono, :Avatar_Url)
    `;
    const binds = { 
      Nombre_Usuario, 
      Correo, 
      Contraseña: hashedPassword,  // Usamos la contraseña hasheada o null si no fue proporcionada
      Rol, 
      Telefono: Telefono || null,  // Aceptamos valores nulos en caso de que no se proporcione teléfono
      Avatar_Url: Avatar_Url || null  // Aceptamos valores nulos si no se proporciona un avatar
    };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Usuario creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el usuario: ' + err.message);
    }
  },

  // Actualizar usuario
  actualizar: async (data) => {
    const { Usuario_ID, Nombre_Usuario, Telefono, Avatar_Url } = data;
    
    const query = `
      UPDATE Usuarios 
      SET NOMBRE_USUARIO = :Nombre_Usuario,
          TELEFONO = :Telefono,
          AVATAR_URL = :Avatar_Url
      WHERE USUARIO_ID = :Usuario_ID
    `;
    const binds = {
      Usuario_ID, 
      Nombre_Usuario, 
      Telefono: Telefono || null,  // Aceptamos nulos en caso de que no se proporcione teléfono
      Avatar_Url: Avatar_Url || null  // Aceptamos nulos si no se proporciona un avatar
    };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Usuario actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el usuario: ' + err.message);
    }
  },

  // Eliminar usuario
  eliminar: async (Usuario_ID) => {
    const query = `
      DELETE FROM Usuarios
      WHERE USUARIO_ID = :Usuario_ID
    `;
    const binds = { Usuario_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      return { message: 'Usuario eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el usuario: ' + err.message);
    }
  },

  // Buscar usuario por correo
  findByEmail: async (correo) => {
    const query = `SELECT USUARIO_ID, NOMBRE_USUARIO, CORREO, CONTRASEÑA, ROL, TELEFONO, AVATAR_URL FROM USUARIOS WHERE CORREO = :correo`;
    const binds = { correo };
  
    try {
      const result = await db.executeQuery(query, binds);
  
      if (result.rows.length === 0) {
        return null;
      }
  
      const usuario = result.rows[0];
      const columnNames = result.metaData.map(col => col.name);
  
      const userObj = {
        USUARIO_ID: usuario[columnNames.indexOf('USUARIO_ID')],
        NOMBRE_USUARIO: usuario[columnNames.indexOf('NOMBRE_USUARIO')],
        CORREO: usuario[columnNames.indexOf('CORREO')],
        CONTRASEÑA: usuario[columnNames.indexOf('CONTRASEÑA')],
        ROL: usuario[columnNames.indexOf('ROL')],
        TELEFONO: usuario[columnNames.indexOf('TELEFONO')],
        AVATAR_URL: usuario[columnNames.indexOf('AVATAR_URL')],
      };
  
      return userObj;
    } catch (err) {
      throw new Error("Error al buscar el usuario: " + err.message);
    }
  },

  // Comparar contraseñas
  comparePassword: async (password, hash) => {
    if (!password || !hash) {
      throw new Error('Contraseña o hash no definidos');
    }
    return bcrypt.compare(password, hash);
  },

  // Obtener todos los usuarios
  obtenerTodos: async () => {
    const query = `SELECT USUARIO_ID, NOMBRE_USUARIO, CORREO, ROL, TELEFONO, AVATAR_URL FROM USUARIOS`;
    
    try {
      const result = await db.executeQuery(query);
      return result.rows.map(row => {
        const columnNames = result.metaData.map(col => col.name);
        return {
          USUARIO_ID: row[columnNames.indexOf('USUARIO_ID')],
          NOMBRE_USUARIO: row[columnNames.indexOf('NOMBRE_USUARIO')],
          CORREO: row[columnNames.indexOf('CORREO')],
          ROL: row[columnNames.indexOf('ROL')],
          TELEFONO: row[columnNames.indexOf('TELEFONO')],
          AVATAR_URL: row[columnNames.indexOf('AVATAR_URL')],
        };
      });
    } catch (err) {
      throw new Error("Error al obtener usuarios: " + err.message);
    }
  }
};

module.exports = Usuario;
