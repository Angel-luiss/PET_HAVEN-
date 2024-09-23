//const Pago = require('../models/pagos.model.js');
const Pago = require('../models/pagos.model.js');

// Función para crear un nuevo pago
async function crearPago(req, res) {
  try {
    const result = await Pago.crear(req.body);
    res.status(201).send(result);  // Estado 201 si la creación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para obtener todos los pagos
async function obtenerPagos(req, res) {
  try {
    const pagos = await Pago.obtenerTodos();
    res.status(200).json(pagos);  // Devuelve los pagos en formato JSON
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para actualizar un pago
async function actualizarPago(req, res) {
  try {
    const result = await Pago.actualizar(req.body);
    res.status(200).send(result);  // Estado 200 si la actualización fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para eliminar un pago
async function eliminarPago(req, res) {
  try {
    const result = await Pago.eliminar(req.params.Pago_ID);
    res.status(200).send(result);  // Estado 200 si la eliminación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

module.exports = {
  crearPago,
  obtenerPagos,
  actualizarPago,
  eliminarPago
};
