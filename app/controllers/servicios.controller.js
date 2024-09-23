const Servicio = require('../models/servicios.model.js');

async function crearServicio(req, res) {
  try {
    const result = await Servicio.crear(req.body);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function obtenerServicios(req, res) {
  try {
    const servicios = await Servicio.obtenerTodos();
    res.status(200).json(servicios);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarServicio(req, res) {
  try {
    const result = await Servicio.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarServicio(req, res) {
  try {
    const result = await Servicio.eliminar(req.params.Servicio_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearServicio,
  obtenerServicios,
  actualizarServicio,
  eliminarServicio
};
