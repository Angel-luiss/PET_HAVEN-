//const Habitacion = require('../models/habitaciones.model.js');
const Habitacion = require('../models/habitaciones.model.js');

async function crearHabitacion(req, res) {
  try {
    const result = await Habitacion.crear(req.body);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function obtenerHabitaciones(req, res) {
  try {
    const habitaciones = await Habitacion.obtenerTodos();
    res.status(200).json(habitaciones);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarHabitacion(req, res) {
  try {
    const result = await Habitacion.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarHabitacion(req, res) {
  try {
    const result = await Habitacion.eliminar(req.params.Habitacion_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearHabitacion,
  obtenerHabitaciones,
  actualizarHabitacion,
  eliminarHabitacion
};
