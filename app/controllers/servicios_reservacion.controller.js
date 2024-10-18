const ServicioReservacion = require('../models/servicios_reservacion.model.js');

// Controlador para crear múltiples servicios de reservación
async function crearMultiplesServiciosReservacion(req, res) {
  try {
    let servicios = req.body.servicios;

    console.log('Datos de servicios recibidos en el backend (originales):', servicios);

    servicios = servicios.map(servicio => {
      let { Precio } = servicio;

      // Convertir el precio a número si es una cadena
      if (typeof Precio === 'string') {
        Precio = parseFloat(Precio.replace(',', '.'));  // Reemplazar coma por punto
      }

      // Validar si el precio es un número
      if (typeof Precio !== 'number' || isNaN(Precio)) {
        throw new Error('Precio inválido en uno de los servicios.');
      }

      return {
        ...servicio,
        Precio,
      };
    });

    console.log('Datos de servicios procesados (precios convertidos a números):', servicios);

    if (!servicios || !Array.isArray(servicios) || servicios.length === 0) {
      return res.status(400).send({ message: "No se enviaron servicios o el formato es incorrecto." });
    }

    const result = await ServicioReservacion.crearMultiples(servicios);
    res.status(201).send(result);
  } catch (err) {
    console.error("Error al crear múltiples servicios de reservación:", err.message);
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearMultiplesServiciosReservacion,
};
