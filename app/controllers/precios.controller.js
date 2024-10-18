//const Precio = require('../models/precios.model.js');
const Precio = require('../models/precios.model.js');

async function crearPrecio(req, res) {
  try {
    const result = await Precio.crear(req.body);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function obtenerPrecios(req, res) {
  try {
    const precios = await Precio.obtenerTodos();
    res.status(200).json(precios);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarPrecio(req, res) {
  try {
    const result = await Precio.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarPrecio(req, res) {
  try {
    const result = await Precio.eliminar(req.params.Precio_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearPrecio,
  obtenerPrecios,
  actualizarPrecio,
  eliminarPrecio
};
