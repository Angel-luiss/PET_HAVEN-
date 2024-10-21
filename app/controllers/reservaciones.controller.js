//const Reservacion = require('../models/reservaciones.model.js');
const Reservacion = require('../models/reservaciones.model.js');

async function crearReservacion(req, res) {
  try {
    console.log('Datos recibidos:', req.body); // Verificar los datos recibidos

    const { Mascota_ID, Habitacion_ID, FECHA_ENTRADA, FECHA_SALIDA, TOTAL, NOTAS } = req.body;

    // Validar campos obligatorios
    if (!Mascota_ID || !Habitacion_ID || !FECHA_ENTRADA || !FECHA_SALIDA || !TOTAL) {
      return res.status(400).send({ message: 'Faltan campos obligatorios en la solicitud.' });
    }

    // Crear la reservación llamando al modelo
    const result = await Reservacion.crear(req.body);
    
    console.log('ID de reservación creado:', result.Reservacion_ID); // Imprimir en consola el ID de la reservación

    // Enviar el ID de la reservación como respuesta al cliente
    res.status(201).send({ RESERVACION_ID: result.Reservacion_ID, message: 'Reservación creada con éxito' });
  } catch (err) {
    console.error('Error al crear la reservación:', err); // Imprimir errores en consola
    res.status(500).send({ message: 'Error al crear la reservación: ' + err.message });
  }
}


async function obtenerReservaciones(req, res) {
  try {
    const reservaciones = await Reservacion.obtenerTodos();
    res.status(200).json(reservaciones);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

// Nuevo controlador para obtener reservaciones por id de usuario
async function obtenerReservacionesPorUsuario(req, res) {
  try {
    const id_usuario = req.params.id_usuario;  // Captura el id del usuario desde la URL
    const reservaciones = await Reservacion.obtenerPorUsuario(id_usuario);
    res.status(200).json(reservaciones);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}


// Nuevo controlador para obtener el historial de reservas por id de usuario
async function obtenerHistorialReservaciones(req, res) {
  try {
    const id_usuario = req.params.id_usuario;  // Captura el id del usuario desde la URL
    const historial = await Reservacion.obtenerHistorialPorUsuario(id_usuario);
    res.status(200).json(historial);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}



async function actualizarReservacion(req, res) {
  try {
    const result = await Reservacion.actualizar(req.body);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

async function eliminarReservacion(req, res) {
  try {
    const result = await Reservacion.eliminar(req.params.Reservacion_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearReservacion,
  obtenerReservaciones,
  actualizarReservacion,
  eliminarReservacion,
  obtenerHistorialReservaciones,
  obtenerReservacionesPorUsuario
};
