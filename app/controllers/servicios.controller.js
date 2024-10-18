const Servicio = require('../models/servicios.model.js');

// Crear un nuevo servicio
async function crearServicio(req, res) {
  try {
    const result = await Servicio.crear(req.body);
    res.status(201).send(result); // Devuelve un estado 201 cuando el servicio se crea exitosamente
  } catch (err) {
    res.status(500).send({ message: err.message }); // Devuelve un error 500 si ocurre un problema en el servidor
  }
}

// Obtener todos los servicios
async function obtenerServicios(req, res) {
  try {
    const servicios = await Servicio.obtenerTodos();
    res.status(200).json(servicios); // Devuelve los servicios en formato JSON
  } catch (err) {
    res.status(500).send({ message: err.message }); // Devuelve un error 500 si ocurre un problema en el servidor
  }
}

// Actualizar un servicio existente
async function actualizarServicio(req, res) {
  try {
    const result = await Servicio.actualizar(req.body); // Usa los datos proporcionados en el cuerpo de la solicitud
    res.status(200).send(result); // Devuelve el resultado de la operación en estado 200 si es exitosa
  } catch (err) {
    res.status(500).send({ message: err.message }); // Devuelve un error 500 si ocurre un problema en el servidor
  }
}

// Eliminar un servicio
async function eliminarServicio(req, res) {
  try {
    const result = await Servicio.eliminar(req.params.Servicio_ID); // Usa el parámetro `Servicio_ID` en la URL
    res.status(200).send(result); // Devuelve el resultado de la operación en estado 200 si es exitosa
  } catch (err) {
    res.status(500).send({ message: err.message }); // Devuelve un error 500 si ocurre un problema en el servidor
  }
}

module.exports = {
  crearServicio,
  obtenerServicios,
  actualizarServicio,
  eliminarServicio
};
