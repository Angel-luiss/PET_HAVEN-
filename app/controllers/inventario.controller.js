//const Inventario = require('../models/inventario.model.js');
const Inventario = require('../models/inventario.model.js');

// Función para crear un nuevo ítem de inventario
async function crearInventario(req, res) {
  try {
    const result = await Inventario.crear(req.body);
    res.status(201).send(result);  // Estado 201 si la creación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para obtener todos los ítems de inventario
async function obtenerInventarios(req, res) {
  try {
    const inventarios = await Inventario.obtenerTodos();
    res.status(200).json(inventarios);  // Devuelve los ítems de inventario en formato JSON
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para actualizar un ítem de inventario
async function actualizarInventario(req, res) {
  try {
    const result = await Inventario.actualizar(req.body);
    res.status(200).send(result);  // Estado 200 si la actualización fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para eliminar un ítem de inventario
async function eliminarInventario(req, res) {
  try {
    const result = await Inventario.eliminar(req.params.Inventario_ID);
    res.status(200).send(result);  // Estado 200 si la eliminación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

module.exports = {
  crearInventario,
  obtenerInventarios,
  actualizarInventario,
  eliminarInventario
};
