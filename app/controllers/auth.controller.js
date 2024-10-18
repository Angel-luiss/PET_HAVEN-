const Usuario = require('../models/usuarios.model');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { OAuth2Client } = require('google-auth-library');
const path = require('path');
const fs = require('fs');

// Inicializa el cliente de Google OAuth2
const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);
const secretKey = 'supersecretkey';  // Cambia esta clave por una más segura

// Autenticación por correo y contraseña
async function login(req, res) {
  const { correo, password } = req.body;

  try {
    // Buscar usuario por correo
    const usuario = await Usuario.findByEmail(correo);

    if (!usuario) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    // Verificar la contraseña
    const validPassword = await bcrypt.compare(password, usuario.CONTRASEÑA);

    if (!validPassword) {
      return res.status(401).json({ message: 'Contraseña incorrecta' });
    }

    // Crear el token JWT incluyendo el ID del usuario, correo, rol y URL del avatar
    const token = jwt.sign(
      { id: usuario.USUARIO_ID, correo: usuario.CORREO, rol: usuario.ROL, avatarUrl: usuario.AVATAR_URL }, 
      secretKey, 
      { expiresIn: '1h' }
    );

    res.status(200).json({ token, message: "Login exitoso" });
  } catch (error) {
    console.error("Error en el servidor durante la autenticación:", error);
    res.status(500).json({ message: "Error en el servidor: " + error.message });
  }
}

// Autenticación con Google
async function googleLogin(req, res) {
  const { tokenId } = req.body;

  try {
    console.log("Token recibido de Google:", tokenId);

    // Verificar el token recibido del frontend
    const ticket = await client.verifyIdToken({
      idToken: tokenId,
      audience: process.env.GOOGLE_CLIENT_ID,
    });

    const { email, name, picture } = ticket.getPayload();  // Ahora obtenemos también la imagen de perfil

    // Buscar usuario por correo
    let usuario = await Usuario.findByEmail(email);
    
    // Si no existe el usuario, lo creamos
    if (!usuario) {
      console.log("Usuario no encontrado. Creando nuevo usuario con Google.");
      usuario = await Usuario.crear({
        Nombre_Usuario: name,
        Correo: email,
        Contraseña: null,
        Rol: 'usuario',
        Avatar_Url: picture || null
      });
    }

    // Crear el token JWT
    const token = jwt.sign(
      { id: usuario.USUARIO_ID, correo: usuario.CORREO, rol: usuario.ROL, avatarUrl: usuario.AVATAR_URL }, 
      secretKey, 
      { expiresIn: '1h' }
    );

    console.log("Usuario autenticado con Google. JWT generado:", token);
    res.status(200).json({ token });
  } catch (error) {
    console.error("Error en la autenticación con Google:", error);
    res.status(500).json({ message: "Error al autenticar con Google: " + error.message });
  }
}

// Función para obtener el usuario autenticado
async function obtenerUsuarioAutenticado(req, res) {
  const token = req.headers['x-access-token'];

  console.log("Token recibido:", token);

  if (!token) {
    return res.status(401).json({ message: 'Token no proporcionado' });
  }

  try {
    const decoded = jwt.verify(token, secretKey);
    console.log("Datos decodificados del token:", decoded);

    const usuario = await Usuario.findByEmail(decoded.correo);

    if (!usuario) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    console.log("Usuario encontrado:", usuario);

    const { USUARIO_ID, NOMBRE_USUARIO, CORREO, ROL, AVATAR_URL, TELEFONO } = usuario;
    res.status(200).json({ USUARIO_ID, NOMBRE_USUARIO, CORREO, ROL, AVATAR_URL, TELEFONO });
  } catch (error) {
    console.error("Error al obtener el usuario autenticado:", error);
    res.status(500).json({ message: 'Error en el servidor' });
  }
}

// Función para actualizar perfil (incluyendo la URL de la imagen)
async function actualizarPerfil(req, res) {
  const { usuarioId, nombreUsuario, telefono } = req.body;
  let avatarUrl = req.body.avatarUrl;  // La URL del avatar enviada desde el frontend (en caso de no haber un nuevo archivo)
  
  try {
    // Si se proporciona un archivo de imagen, guardarlo en la carpeta y obtener la nueva URL
    if (req.file) {
      const imagePath = path.join(__dirname, '../recursos/imgs-perfil', req.file.filename);
      avatarUrl = `/imgs-perfil/${req.file.filename}`;  // Ruta accesible públicamente
    }

    // Actualizar los datos del usuario en la base de datos
    await Usuario.actualizar({
      Usuario_ID: usuarioId,
      Nombre_Usuario: nombreUsuario,
      Telefono: telefono || null,  // Aceptamos valores nulos para teléfono
      Avatar_Url: avatarUrl  // La nueva URL o la anterior
    });

    res.status(200).json({ message: "Perfil actualizado correctamente.", avatarUrl });
  } catch (error) {
    console.error("Error al actualizar el perfil:", error);
    res.status(500).json({ message: "Error al actualizar el perfil." });
  }
}

module.exports = { login, googleLogin, obtenerUsuarioAutenticado, actualizarPerfil };
