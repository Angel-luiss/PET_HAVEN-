//const Pago = require('../models/pagos.model.js');
const Pago = require('../models/pagos.model.js');

// pagos.controller.js
const stripe = require('stripe')('sk_test_51Q7rPlP9VBpcKRyaRqtSmgjJu7s1mYf9tjoBc0Q5AB65wfB7LILzQjzZNCmSI9AsSmN3xYtMeToUQuUrW2SFjYPe00JxlYWKOp'); // Clave secreta de Stripe

async function crearIntencion(req, res) {
  const { amount } = req.body;

  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount: Math.round(amount * 100), // Convertir a centavos
      currency: 'usd',
      payment_method_types: ['card'],
    });

    res.json({ clientSecret: paymentIntent.client_secret });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Función para crear un nuevo pago
async function crearPago(req, res) {
  try {
    console.log('Datos recibidos:', req.body); // Verificar los datos recibidos en consola
    const result = await Pago.crear(req.body);
    res.status(201).send(result);  // Estado 201 si la creación fue exitosa
  } catch (err) {
    res.status(500).send({ message: 'Error al crear el pago: ' + err.message });  // Error 500 en caso de fallo
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
  eliminarPago,
  crearIntencion
};
