//const Usuario = require('../models/usuario.model.js');
const Usuario = require('../models/usuarios.model.js');
const bcrypt = require('bcrypt');




async function crearUsuario(req, res) {
  try {
    const { nombreUsuario, email, telefono, contraseña, rol, avatarUrl } = req.body;

    console.log("Datos recibidos en el backend:", req.body);  // Agrega este log para depurar

    // Si se proporciona un archivo de imagen, guardarlo en la carpeta
    let avatarPath = avatarUrl;
    if (req.file) {
      avatarPath = `/imgs-perfil/${req.file.filename}`;
    }

    // Asegúrate de que los datos se envíen correctamente al modelo
    const result = await Usuario.crear({
      Nombre_Usuario: nombreUsuario,  // Verifica que este valor no sea nulo
      Correo: email,
      Telefono: telefono || null,
      Contraseña: contraseña,
      Rol: rol || 'usuario',
      Avatar_Url: avatarPath || null,
    });

    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}



async function obtenerUsuarios(req, res) {
  try {
    const usuarios = await Usuario.obtenerTodos();
    res.status(200).json(usuarios);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarUsuario(req, res) {
  try {
    const result = await Usuario.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarUsuario(req, res) {
  try {
    const result = await Usuario.eliminar(req.params.Usuario_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearUsuario,
  obtenerUsuarios,
  actualizarUsuario,
  eliminarUsuario
};
