const express = require('express');
const cors = require('cors');
const db = require('./app/config/db.config.js');  // Asegúrate de que este archivo use oracledb
const oracledb = require('oracledb');
const bodyParser = require('body-parser');
const router = require('./app/routers/router.js');  // Importar las rutas correctas
const path = require('path');

// Configurar modo Thick para usar Oracle Instant Client
try {
  oracledb.initOracleClient({ libDir: 'C:\\oracole\\instantclient_23_5' });  // Asegúrate de que esta ruta es correcta
  console.log('Cliente Oracle inicializado en modo Thick.');
} catch (err) {
  console.error('No se pudo inicializar el cliente Oracle:', err);
  process.exit(1);
}

// Crear instancia de Express
const app = express();

// Configurar CORS
app.use(cors({
  origin: 'http://localhost:3001',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
}));

// Middleware para parsear el body de las peticiones
app.use(bodyParser.json());

// Usar las rutas de autenticación y otras rutas
app.use('/api', router);

// Servir archivos estáticos desde la carpeta 'recursos/imgs-perfil'
app.use('/imgs-perfil', express.static(path.join(__dirname, 'recursos/imgs-perfil')));
app.use('/imgs-mascotas', express.static(path.join(__dirname, 'recursos/imgs-mascotas')));
// Servir archivos estáticos desde la carpeta 'recursos/imgs-habitaciones'
app.use('/imgs-habitaciones', express.static(path.join(__dirname, 'recursos/imgs-habitaciones')));



// Ruta de bienvenida
app.get("/", (req, res) => {
  res.json({ message: "Bienvenido Estudiantes de UMG" });
});

// Inicializar la base de datos y luego levantar el servidor
db.initialize().then(() => {
  const port = process.env.PORT || 3000;

  const server = app.listen(port, function () {
    const host = server.address().address;
    const port = server.address().port;
    console.log("App listening at http://%s:%s", host, port);
  });
}).catch(err => {
  console.error('Error al inicializar la base de datos:', err);
});
