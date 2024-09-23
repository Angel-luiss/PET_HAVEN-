const express = require('express');
const router = express.Router();

const usuarioController = require('../controllers/usuarios.controller.js');
router.post('/usuarios', usuarioController.crearUsuario);// Ruta para crear un nuevo usuario
router.get('/usuarios', usuarioController.obtenerUsuarios);// Ruta para obtener todos los usuarios
router.put('/usuarios', usuarioController.actualizarUsuario);// Ruta para actualizar un usuario
router.delete('/usuarios/:Usuario_ID', usuarioController.eliminarUsuario);// Ruta para eliminar un usuario

const serviciosController = require('../controllers/servicios.controller.js');
router.post('/servicios', serviciosController.crearServicio);
router.get('/servicios', serviciosController.obtenerServicios);
router.put('/servicios', serviciosController.actualizarServicio);
router.delete('/servicios/:Servicio_ID', serviciosController.eliminarServicio);

const proveedorController = require('../controllers/proveedores.controller.js');
router.post('/proveedores', proveedorController.crearProveedor);  // Ruta para crear un nuevo proveedor
router.get('/proveedores', proveedorController.obtenerProveedores);  // Ruta para obtener todos los proveedores
router.put('/proveedores', proveedorController.actualizarProveedor);  // Ruta para actualizar un proveedor
router.delete('/proveedores/:Proveedor_ID', proveedorController.eliminarProveedor);  // Ruta para eliminar un proveedor

const mascotaController = require('../controllers/mascotas.controller.js');  // Verifica que la ruta sea correcta
router.post('/mascotas', mascotaController.crearMascota);  // Ruta para crear una nueva mascota
router.get('/mascotas', mascotaController.obtenerMascotas);  // Ruta para obtener todas las mascotas
router.put('/mascotas', mascotaController.actualizarMascota);  // Ruta para actualizar una mascota
router.delete('/mascotas/:Mascota_ID', mascotaController.eliminarMascota);  // Ruta para eliminar una mascota

const habitacionController = require('../controllers/habitaciones.controller.js');
router.post('/habitaciones', habitacionController.crearHabitacion);  // Ruta para crear una nueva habitación
router.get('/habitaciones', habitacionController.obtenerHabitaciones);  // Ruta para obtener todas las habitaciones
router.put('/habitaciones', habitacionController.actualizarHabitacion);  // Ruta para actualizar una habitación
router.delete('/habitaciones/:Habitacion_ID', habitacionController.eliminarHabitacion);  // Ruta para eliminar una habitación

const precioController = require('../controllers/precios.controller.js');
router.post('/precios', precioController.crearPrecio);  // Ruta para crear un nuevo precio
router.get('/precios', precioController.obtenerPrecios);  // Ruta para obtener todos los precios
router.put('/precios', precioController.actualizarPrecio);  // Ruta para actualizar un precio
router.delete('/precios/:Precio_ID', precioController.eliminarPrecio);  // Ruta para eliminar un precio

const reservacionController = require('../controllers/reservaciones.controller.js');
router.post('/reservaciones', reservacionController.crearReservacion);  // Ruta para crear una nueva reservación
router.get('/reservaciones', reservacionController.obtenerReservaciones);  // Ruta para obtener todas las reservaciones
router.put('/reservaciones', reservacionController.actualizarReservacion);  // Ruta para actualizar una reservación
router.delete('/reservaciones/:Reservacion_ID', reservacionController.eliminarReservacion);  // Ruta para eliminar una reservación

const servicioReservacionController = require('../controllers/servicios_reservacion.controller.js');
router.post('/servicios_reservacion', servicioReservacionController.crearServicioReservacion);  // Ruta para crear un nuevo servicio de reservación
router.get('/servicios_reservacion', servicioReservacionController.obtenerServiciosReservacion);  // Ruta para obtener todos los servicios de reservación
router.put('/servicios_reservacion', servicioReservacionController.actualizarServicioReservacion);  // Ruta para actualizar un servicio de reservación
router.delete('/servicios_reservacion/:Servicio_Reservacion_ID', servicioReservacionController.eliminarServicioReservacion);  // Ruta para eliminar un servicio de reservación

const pagoController = require('../controllers/pagos.controller.js');
router.post('/pagos', pagoController.crearPago);  // Ruta para crear un nuevo pago
router.get('/pagos', pagoController.obtenerPagos);  // Ruta para obtener todos los pagos
router.put('/pagos', pagoController.actualizarPago);  // Ruta para actualizar un pago
router.delete('/pagos/:Pago_ID', pagoController.eliminarPago);  // Ruta para eliminar un pago

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


module.exports = router;
