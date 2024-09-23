const express = require('express');
const cors = require('cors');
const db = require('./app/config/db.config.js');  // Asegúrate de que este archivo use oracledb

// Crear instancia de Express
const app = express();

// Configurar CORS
const corsOptions = {
  origin: 'http://localhost:4200',  // O la URL de tu frontend
  optionsSuccessStatus: 200
};
app.use(cors(corsOptions));

// Parsear el cuerpo de la petición como JSON (esto sustituye a body-parser)
app.use(express.json());

// Importar las rutas
const router = require('./app/routers/router.js');
app.use('/api', router);  // Todas las rutas estarán bajo "/api"

// Ruta de bienvenida
app.get("/", (req, res) => {
  res.json({ message: "Bienvenido Estudiantes de UMG" });
});

// Inicializar la base de datos y luego levantar el servidor
db.initialize().then(() => {
  // Definir el puerto, puedes usar una variable de entorno o el valor por defecto (8080)
  const port = process.env.PORT || 8080;

  // Crear el servidor solo si la conexión a la base de datos es exitosa
  const server = app.listen(port, function () {
    const host = server.address().address;
    const port = server.address().port;
    console.log("App listening at http://%s:%s", host, port);
  });
}).catch(err => {
  console.error('Error al inicializar la base de datos:', err);
});
