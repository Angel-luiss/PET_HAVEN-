//const Mascota = require('../models/mascotas.model.js');
const Mascota = require('../models/mascotas.model.js');

async function crearMascota(req, res) {
  try {
    const result = await Mascota.crear(req.body);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function obtenerMascotas(req, res) {
  try {
    const mascotas = await Mascota.obtenerTodos();
    res.status(200).json(mascotas);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarMascota(req, res) {
  try {
    const result = await Mascota.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarMascota(req, res) {
  try {
    const result = await Mascota.eliminar(req.params.Mascota_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearMascota,
  obtenerMascotas,
  actualizarMascota,
  eliminarMascota
};
