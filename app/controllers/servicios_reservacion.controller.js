//const ServicioReservacion = require('../models/servicios_reservacion.model.js');
const ServicioReservacion = require('../models/servicios_reservacion.model.js');

// Función para crear una nueva entrada de servicio de reservación
async function crearServicioReservacion(req, res) {
  try {
    // Llama al modelo para crear el servicio de reservación con los datos proporcionados
    const result = await ServicioReservacion.crear(req.body);
    res.status(201).send(result);  // Devuelve un estado 201 (creado) y el resultado del insert
  } catch (err) {
    res.status(500).send({ message: err.message });  // Devuelve un error 500 en caso de fallo
  }
}

// Función para obtener todos los servicios de reservación
async function obtenerServiciosReservacion(req, res) {
  try {
    // Llama al modelo para obtener todos los registros de la tabla Servicios_Reservacion
    const servicios = await ServicioReservacion.obtenerTodos();
    res.status(200).json(servicios);  // Devuelve los servicios obtenidos en formato JSON
  } catch (err) {
    res.status(500).send({ message: err.message });  // Devuelve un error 500 en caso de fallo
  }
}

// Función para actualizar un servicio de reservación existente
async function actualizarServicioReservacion(req, res) {
  try {
    // Llama al modelo para actualizar el servicio de reservación con los nuevos datos proporcionados
    const result = await ServicioReservacion.actualizar(req.body);
    res.status(200).send(result);  // Devuelve un estado 200 (OK) si la actualización fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Devuelve un error 500 en caso de fallo
  }
}

// Función para eliminar un servicio de reservación por su ID
async function eliminarServicioReservacion(req, res) {
  try {
    // Llama al modelo para eliminar el servicio de reservación según su ID
    const result = await ServicioReservacion.eliminar(req.params.Servicio_Reservacion_ID);
    res.status(200).send(result);  // Devuelve un estado 200 (OK) si la eliminación fue exitosa
  } catch (err) {
    res.status(500).send({ message: err.message });  // Devuelve un error 500 en caso de fallo
  }
}

// Exporta todas las funciones del controlador para que puedan ser usadas en las rutas
module.exports = {
  crearServicioReservacion,
  obtenerServiciosReservacion,
  actualizarServicioReservacion,
  eliminarServicioReservacion
};
