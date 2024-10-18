const db = require('../config/db.config.js');
const oracledb = require('oracledb'); // Importar oracledb

const ServicioReservacion = {
  // Función para crear una nueva entrada de servicio de reservación
  crear: async (data) => {
    const { Reservacion_ID, Servicio_ID, Cantidad, Precio } = data;

    // Asegurarse de que el Precio es un número válido
    let PrecioFormateado = Precio;
    if (typeof Precio === 'string') {
      PrecioFormateado = parseFloat(Precio.replace(',', '.')); // Convertir coma a punto
    }

    const query = `
      INSERT INTO Servicios_Reservaciones (Reservacion_ID, Servicio_ID, Cantidad, Precio)
      VALUES (:Reservacion_ID, :Servicio_ID, :Cantidad, :Precio)
    `;
    
    const binds = { Reservacion_ID, Servicio_ID, Cantidad, Precio: PrecioFormateado };

    try {
      // Ejecutar la consulta con autoCommit activado
      const result = await db.executeQuery(query, binds, { autoCommit: true });
      console.log('Inserción exitosa:', result);
      return { message: 'Servicio de reservación creado con éxito' };
    } catch (err) {
      console.error('Error al crear el servicio de reservación:', err.message);
      throw new Error('Error al crear el servicio de reservación: ' + err.message);
    }
  },

  // Función para crear múltiples entradas de servicio de reservación
  crearMultiples: async (servicios) => {
    try {
      console.log("Servicios recibidos para inserción:", servicios);

      for (const servicio of servicios) {
        const { Reservacion_ID, Servicio_ID, Cantidad, Precio } = servicio;

        let PrecioFormateado = Precio;
        if (typeof Precio === 'string') {
          PrecioFormateado = parseFloat(Precio.replace(',', '.'));  // Reemplazar coma por punto
        }

        const query = `
          INSERT INTO Servicios_Reservaciones (Reservacion_ID, Servicio_ID, Cantidad, Precio)
          VALUES (:Reservacion_ID, :Servicio_ID, :Cantidad, :Precio)
        `;
        
        const binds = {
          Reservacion_ID,
          Servicio_ID,
          Cantidad,
          Precio: PrecioFormateado
        };

        const result = await db.executeQuery(query, binds, { autoCommit: true });
        console.log(`Servicio insertado con Reservacion_ID=${Reservacion_ID} y Servicio_ID=${Servicio_ID}`);
      }

      console.log("Todas las inserciones completadas con éxito");
      return { message: 'Servicios de reservación creados con éxito' };
    } catch (err) {
      console.error("Error en la inserción de los servicios:", err.message);
      throw new Error('Error al crear los servicios de reservación: ' + err.message);
    }
  }
};

module.exports = ServicioReservacion;
