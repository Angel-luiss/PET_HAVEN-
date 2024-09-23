//const Usuario = require('../models/usuario.model.js');
const Usuario = require('../models/usuarios.model.js');

async function crearUsuario(req, res) {
  try {
    const result = await Usuario.crear(req.body);
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
