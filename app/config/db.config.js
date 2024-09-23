const oracledb = require('oracledb');
const env = require('./env.js');

// Crear la conexión a Oracle
async function initialize() {
  try {
    await oracledb.createPool({
      user: env.user,
      password: env.password,
      connectString: env.connectString
    });
    console.log('Conexión a Oracle establecida');
  } catch (err) {
    console.error('Error al conectarse a Oracle:', err);
  }
}

// Cerrar la conexión
async function close() {
  try {
    await oracledb.getPool().close(10);  // Esperar hasta 10 segundos para cerrar conexiones
    console.log('Conexión a Oracle cerrada');
  } catch (err) {
    console.error('Error al cerrar la conexión a Oracle:', err);
  }
}

// Función para ejecutar consultas
async function executeQuery(query, binds = [], options = {}) {
  let connection;
  try {
    connection = await oracledb.getConnection();
    const result = await connection.execute(query, binds, options);
    return result;
  } catch (err) {
    console.error('Error al ejecutar la consulta:', err);
    throw err;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error('Error al cerrar la conexión:', err);
      }
    }
  }
}

module.exports = {
  initialize,
  close,
  executeQuery
};
