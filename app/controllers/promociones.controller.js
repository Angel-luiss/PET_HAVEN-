//const Promocion = require('../models/promociones.model.js');
const Promocion = require('../models/promociones.model.js');

// Función para crear una nueva promoción
async function crearPromocion(req, res) {
  try {
    const result = await Promocion.crear(req.body);
    res.status(201).send(result);  // Estado 201 si la creación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para obtener todas las promociones
async function obtenerPromociones(req, res) {
  try {
    const promociones = await Promocion.obtenerTodos();
    res.status(200).json(promociones);  // Devuelve las promociones en formato JSON
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para actualizar una promoción
async function actualizarPromocion(req, res) {
  try {
    const result = await Promocion.actualizar(req.body);
    res.status(200).send(result);  // Estado 200 si la actualización fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

// Función para eliminar una promoción
async function eliminarPromocion(req, res) {
  try {
    const result = await Promocion.eliminar(req.params.Promocion_ID);
    res.status(200).send(result);  // Estado 200 si la eliminación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Error 500 en caso de fallo
  }
}

module.exports = {
  crearPromocion,
  obtenerPromociones,
  actualizarPromocion,
  eliminarPromocion
};
