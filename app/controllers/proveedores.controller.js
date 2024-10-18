//const Proveedor = require('../models/proveedores.model.js');
const Proveedor = require('../models/proveedores.model.js');

async function crearProveedor(req, res) {
  try {
    const result = await Proveedor.crear(req.body);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function obtenerProveedores(req, res) {
  try {
    const proveedores = await Proveedor.obtenerTodos();
    res.status(200).json(proveedores);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function actualizarProveedor(req, res) {
  try {
    const result = await Proveedor.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarProveedor(req, res) {
  try {
    const result = await Proveedor.eliminar(req.params.Proveedor_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearProveedor,
  obtenerProveedores,
  actualizarProveedor,
  eliminarProveedor
};
