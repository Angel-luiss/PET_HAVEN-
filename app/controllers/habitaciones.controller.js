const Habitacion = require('../models/habitaciones.model.js');
const path = require('path');
const fs = require('fs');

// Crear una nueva habitación
async function crearHabitacion(req, res) {
  try {
    let imagenes = '';

    // Si se suben imágenes (con multer u otra estrategia de subida de archivos)
    if (req.files && req.files.length > 0) {
      const imagenesArray = req.files.map(file => `/imgs-habitaciones/${file.filename}`);
      imagenes = imagenesArray.join(','); // Concatenar las rutas de imágenes en una cadena separada por comas
    }

    // Crear habitación con todos los datos incluidos las imágenes
    const habitacionData = {
      ...req.body,
      Imagenes: imagenes || req.body.Imagenes  // Si no hay imágenes nuevas, usar las existentes en req.body
    };

    const result = await Habitacion.crear(habitacionData);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

// Obtener todas las habitaciones
async function obtenerHabitaciones(req, res) {
  try {
    const habitaciones = await Habitacion.obtenerTodos();
    res.status(200).json(habitaciones);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

// Función para formatear la fecha
function formatearFecha(fecha) {
  const dateObj = new Date(fecha);
  const day = String(dateObj.getDate()).padStart(2, '0');
  const month = String(dateObj.getMonth() + 1).padStart(2, '0'); // Los meses van de 0 a 11
  const year = dateObj.getFullYear();
  const hours = String(dateObj.getHours()).padStart(2, '0');
  const minutes = String(dateObj.getMinutes()).padStart(2, '0');
  const seconds = String(dateObj.getSeconds()).padStart(2, '0');
  return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
}

async function obtenerHabitacionesDisponibles(req, res) {
  try {
    let { fechaInicio, fechaFin } = req.body;

    // Convertir las fechas al formato correcto para Oracle
    fechaInicio = formatearFecha(fechaInicio);
    fechaFin = formatearFecha(fechaFin);

    console.log("Fecha Inicio formateada:", fechaInicio);
    console.log("Fecha Fin formateada:", fechaFin);

    // Aquí se llama al modelo de habitaciones correctamente
    const habitaciones = await Habitacion.obtenerHabitaciones(fechaInicio, fechaFin);
    res.status(200).send(habitaciones);
  } catch (error) {
    console.error("Error al obtener habitaciones disponibles:", error.message);
    res.status(500).send({ error: error.message });
  }
}



// Actualizar una habitación
async function actualizarHabitacion(req, res) {
  try {
    let imagenes = '';

    // Si se suben imágenes nuevas
    if (req.files && req.files.length > 0) {
      const imagenesArray = req.files.map(file => `/imgs-habitaciones/${file.filename}`);
      imagenes = imagenesArray.join(',');
    }

    // Actualizar habitación con los datos nuevos
    const habitacionData = {
      ...req.body,
      Imagenes: imagenes || req.body.Imagenes  // Mantener las imágenes actuales si no hay nuevas subidas
    };

    const result = await Habitacion.actualizar(habitacionData);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

// Eliminar una habitación
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
  eliminarHabitacion,
  obtenerHabitacionesDisponibles
};
