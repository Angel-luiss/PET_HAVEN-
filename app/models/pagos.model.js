const db = require('../config/db.config.js');  // El archivo que maneja la conexión a oracledb
const oracledb = require('oracledb');

const Pago = {
  // Función para crear un nuevo pago
  crear: async (data) => {
    const { Reservacion_ID, Monto_Total, Metodo_Pago, Estado_Pago } = data;

    // Convertir Monto_Total a número decimal asegurándose de que esté en el formato correcto
    const MontoTotalFormateado = parseFloat(Monto_Total.replace(',', '.'));

    // Ajustar el formato para la fecha de pago
    const query = `
      INSERT INTO Pagos (Reservacion_ID, Monto_Total, Metodo_Pago, Estado_Pago, Fecha_Pago)
      VALUES (:Reservacion_ID, :Monto_Total, :Metodo_Pago, :Estado_Pago, CURRENT_TIMESTAMP)
    `;

    const binds = {
      Reservacion_ID,
      Monto_Total: MontoTotalFormateado, // Asegurarse de que el monto es numérico
      Metodo_Pago,
      Estado_Pago,
    };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });
      console.log('Datos a insertar en la tabla Pagos:', binds); // Verificación en consola
      return { message: 'Pago creado con éxito' };
    } catch (err) {
      throw new Error('Error al crear el pago: ' + err.message);
    }
  },

  // Función para obtener todos los pagos
  obtenerTodos: async () => {
    const query = `SELECT * FROM Pagos`;
    try {
      const result = await db.executeQuery(query);
      return result.rows;  // Devuelve las filas obtenidas
    } catch (err) {
      throw new Error('Error al obtener los pagos: ' + err.message);
    }
  },

  // Función para actualizar un pago
  actualizar: async (data) => {
    const { Pago_ID, Reservacion_ID, Monto_Total, Metodo_Pago, Estado_Pago } = data;
    const query = `
      UPDATE Pagos
      SET Reservacion_ID = :Reservacion_ID,
          Monto_Total = :Monto_Total,
          Metodo_Pago = :Metodo_Pago,
          Estado_Pago = :Estado_Pago
      WHERE Pago_ID = :Pago_ID
    `;
    const binds = { Pago_ID, Reservacion_ID, Monto_Total, Metodo_Pago, Estado_Pago };
    
    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // Asegúrate de hacer commit de la transacción
      return { message: 'Pago actualizado con éxito' };
    } catch (err) {
      throw new Error('Error al actualizar el pago: ' + err.message);
    }
  },

  // Función para eliminar un pago
  eliminar: async (Pago_ID) => {
    const query = `DELETE FROM Pagos WHERE Pago_ID = :Pago_ID`;
    const binds = { Pago_ID };

    try {
      await db.executeQuery(query, binds, { autoCommit: true });  // AutoCommit asegura que la transacción se complete
      return { message: 'Pago eliminado con éxito' };
    } catch (err) {
      throw new Error('Error al eliminar el pago: ' + err.message);
    }
  }
};

module.exports = Pago;
