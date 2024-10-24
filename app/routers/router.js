const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller.js');
const mascotaController = require('../controllers/mascotas.controller.js');
const habitacionController = require('../controllers/habitaciones.controller.js');
const serviciosController = require('../controllers/servicios.controller.js'); // Importar el controlador de servicios
const { obtenerHabitacionesDisponibles } = require('../controllers/habitaciones.controller');
const sendEmail = require('../controllers/sendcorreo.controller.js');


// Ruta para enviar el correo de confirmación
router.post('/send-email', async (req, res) => {
  const { to, subject, htmlContent } = req.body;

  try {
    await sendEmail(to, subject, htmlContent);
    res.status(200).send('Correo enviado con éxito');
  } catch (error) {
    res.status(500).send('Error al enviar el correo');
  }
});


const multer = require('multer');
const path = require('path');

// Configuración de `multer` para guardar archivos de imágenes de perfil
const storagePerfil = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../../recursos/imgs-perfil'));  // Carpeta donde se guardarán las imágenes
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + '-' + file.originalname);  // Generar un nombre único para el archivo
  }
});

// Configuración de `multer` para guardar archivos de imágenes de mascotas
const storageMascotas = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../../recursos/imgs-mascotas'));  // Carpeta donde se guardarán las imágenes de mascotas
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + '-' + file.originalname);  // Generar un nombre único para el archivo
  }
});

// Configuración de `multer` para guardar archivos de imágenes de habitaciones
const storageHabitaciones = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../../recursos/imgs-habitaciones'));  // Carpeta donde se guardarán las imágenes de habitaciones
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + '-' + file.originalname);  // Generar un nombre único para el archivo
  }
});

// Inicializar `multer` con las configuraciones para perfiles, mascotas y habitaciones
const uploadPerfil = multer({ storage: storagePerfil });
const uploadMascota = multer({ storage: storageMascotas });
const uploadHabitacion = multer({ storage: storageHabitaciones });

// Rutas de autenticación
router.post('/login', authController.login);  // Login con correo y contraseña
router.post('/google-login', authController.googleLogin);  // Login con Google

// Ruta para obtener los datos del usuario autenticado
router.get('/me', authController.obtenerUsuarioAutenticado);

// Ruta para actualizar perfil con imagen de perfil
router.put('/usuarios/update', uploadPerfil.single('file'), authController.actualizarPerfil);

// Rutas de usuarios
const usuarioController = require('../controllers/usuarios.controller.js');
router.post('/usuarios', uploadPerfil.single('file'), usuarioController.crearUsuario);
router.get('/usuarios', usuarioController.obtenerUsuarios);
router.put('/usuarios', usuarioController.actualizarUsuario);
router.delete('/usuarios/:Usuario_ID', usuarioController.eliminarUsuario);

// Rutas para mascotas
router.post('/mascotas/nueva', uploadMascota.single('file'), mascotaController.crearMascota);  // Crear mascota
router.get('/mascotas/:propietarioId', mascotaController.obtenerMascotasPorPropietario);  // Obtener todas las mascotas de un propietario
router.put('/mascotas/:mascotaId', uploadMascota.single('file'), mascotaController.actualizarMascota);  // Actualizar mascota usando el ID desde la URL
router.delete('/mascotas/:Mascota_ID', mascotaController.eliminarMascota);  // Eliminar mascota

// Rutas para habitaciones
router.post('/habitaciones/nueva', uploadHabitacion.array('files', 10), habitacionController.crearHabitacion);  // Crear habitación con múltiples imágenes
router.post('/filtrar', obtenerHabitacionesDisponibles);
router.get('/habitaciones', habitacionController.obtenerHabitaciones);  // Obtener todas las habitaciones
router.put('/habitaciones/:Habitacion_ID', uploadHabitacion.array('files', 10), habitacionController.actualizarHabitacion);  // Actualizar habitación usando el ID
router.delete('/habitaciones/:Habitacion_ID', habitacionController.eliminarHabitacion);  // Eliminar habitación


// Rutas para los servicios
router.post('/servicios', serviciosController.crearServicio);
router.get('/servicios', serviciosController.obtenerServicios);
router.put('/servicios/:Servicio_ID', serviciosController.actualizarServicio);
router.delete('/servicios/:Servicio_ID', serviciosController.eliminarServicio);


const pagoController = require('../controllers/pagos.controller.js');
router.post('/pagos', pagoController.crearPago);  // Ruta para crear un nuevo pago
router.get('/pagos', pagoController.obtenerPagos);  // Ruta para obtener todos los pagos
router.put('/pagos', pagoController.actualizarPago);  // Ruta para actualizar un pago
router.delete('/pagos/:Pago_ID', pagoController.eliminarPago);  // Ruta para eliminar un pago


const servicioReservacionController = require('../controllers/servicios_reservacion.controller.js');
router.post('/servicios_reservaciones', servicioReservacionController.crearMultiplesServiciosReservacion);  // Ruta para crear un nuevos servicio de reservación multiples servicios de reserv


const reservacionController = require('../controllers/reservaciones.controller.js');
router.post('/reservaciones', reservacionController.crearReservacion);  // Ruta para crear una nueva reservación
router.get('/reservaciones', reservacionController.obtenerReservaciones);  // Ruta para obtener todas las reservaciones
router.put('/reservaciones', reservacionController.actualizarReservacion);  // Ruta para actualizar una reservación
router.delete('/reservaciones/:Reservacion_ID', reservacionController.eliminarReservacion);  // Ruta para eliminar una reservación
// Nueva ruta para obtener reservaciones por id de usuario
router.get('/reservaciones/usuario/:id_usuario', reservacionController.obtenerReservacionesPorUsuario);
router.get('/reservaciones/historial/:id_usuario', reservacionController.obtenerHistorialReservaciones);




















const proveedorController = require('../controllers/proveedores.controller.js');
router.post('/proveedores', proveedorController.crearProveedor);  // Ruta para crear un nuevo proveedor
router.get('/proveedores', proveedorController.obtenerProveedores);  // Ruta para obtener todos los proveedores
router.put('/proveedores', proveedorController.actualizarProveedor);  // Ruta para actualizar un proveedor
router.delete('/proveedores/:Proveedor_ID', proveedorController.eliminarProveedor);  // Ruta para eliminar un proveedor


const precioController = require('../controllers/precios.controller.js');
router.post('/precios', precioController.crearPrecio);  // Ruta para crear un nuevo precio
router.get('/precios', precioController.obtenerPrecios);  // Ruta para obtener todos los precios
router.put('/precios', precioController.actualizarPrecio);  // Ruta para actualizar un precio
router.delete('/precios/:Precio_ID', precioController.eliminarPrecio);  // Ruta para eliminar un precio







const promocionController = require('../controllers/promociones.controller.js');
router.post('/promociones', promocionController.crearPromocion);  // Ruta para crear una nueva promoción
router.get('/promociones', promocionController.obtenerPromociones);  // Ruta para obtener todas las promociones
router.put('/promociones', promocionController.actualizarPromocion);  // Ruta para actualizar una promoción
router.delete('/promociones/:Promocion_ID', promocionController.eliminarPromocion);  // Ruta para eliminar una promoción

const logDisponibilidadController = require('../controllers/logs_disponibilidad.controller.js');
router.post('/logs_disponibilidad', logDisponibilidadController.crearLogDisponibilidad);  // Ruta para crear un nuevo log de disponibilidad
router.get('/logs_disponibilidad', logDisponibilidadController.obtenerLogsDisponibilidad);  // Ruta para obtener todos los logs de disponibilidad
router.put('/logs_disponibilidad', logDisponibilidadController.actualizarLogDisponibilidad);  // Ruta para actualizar un log de disponibilidad
router.delete('/logs_disponibilidad/:Log_ID', logDisponibilidadController.eliminarLogDisponibilidad);  // Ruta para eliminar un log de disponibilidad

const inventarioController = require('../controllers/inventario.controller.js');
router.post('/inventario', inventarioController.crearInventario);  // Ruta para crear un nuevo ítem de inventario
router.get('/inventario', inventarioController.obtenerInventarios);  // Ruta para obtener todos los ítems de inventario
router.put('/inventario', inventarioController.actualizarInventario);  // Ruta para actualizar un ítem de inventario
router.delete('/inventario/:Inventario_ID', inventarioController.eliminarInventario);  // Ruta para eliminar un ítem de inventario

/////Comit
module.exports = router;
