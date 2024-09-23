//const Reservacion = require('../models/reservaciones.model.js');
const Reservacion = require('../models/reservaciones.model.js');

async function crearReservacion(req, res) {
  try {
    const result = await Reservacion.crear(req.body);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function obtenerReservaciones(req, res) {
  try {
    const reservaciones = await Reservacion.obtenerTodos();
    res.status(200).json(reservaciones);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarReservacion(req, res) {
  try {
    const result = await Reservacion.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarReservacion(req, res) {
  try {
    const result = await Reservacion.eliminar(req.params.Reservacion_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearReservacion,
  obtenerReservaciones,
  actualizarReservacion,
  eliminarReservacion
};
