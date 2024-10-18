//const LogDisponibilidad = require('../models/logs_disponibilidad.model.js');
const LogDisponibilidad = require('../models/logs_disponibilidad.model.js');

// Función para crear un nuevo log de disponibilidad
async function crearLogDisponibilidad(req, res) {
  try {
    const result = await LogDisponibilidad.crear(req.body);
    res.status(201).send(result);  // Estado 201 si la creación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para obtener todos los logs de disponibilidad
async function obtenerLogsDisponibilidad(req, res) {
  try {
    const logs = await LogDisponibilidad.obtenerTodos();
    res.status(200).json(logs);  // Devuelve los logs en formato JSON
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para actualizar un log de disponibilidad
async function actualizarLogDisponibilidad(req, res) {
  try {
    const result = await LogDisponibilidad.actualizar(req.body);
    res.status(200).send(result);  // Estado 200 si la actualización fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para eliminar un log de disponibilidad
async function eliminarLogDisponibilidad(req, res) {
  try {
    const result = await LogDisponibilidad.eliminar(req.params.Log_ID);
    res.status(200).send(result);  // Estado 200 si la eliminación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

module.exports = {
  crearLogDisponibilidad,
  obtenerLogsDisponibilidad,
  actualizarLogDisponibilidad,
  eliminarLogDisponibilidad
};
