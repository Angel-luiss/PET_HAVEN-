const Mascota = require('../models/mascotas.model.js');
const path = require('path');
const fs = require('fs');

// Función para crear una nueva mascota
async function crearMascota(req, res) {
  const { propietarioId, nombreMascota, especie, raza, peso, edad, sexo, categoria } = req.body;
  let fotoUrl = req.body.fotoUrl;  // URL de la foto desde el body si ya se proporcionó

  try {
    // Si se sube un archivo de imagen
    if (req.file) {
      const imagePath = path.join(__dirname, '../../recursos/imgs-mascotas', req.file.filename);
      fotoUrl = `/imgs-mascotas/${req.file.filename}`;
    }

    const mascotaData = {
      Propietario_ID: propietarioId,
      Nombre_Mascota: nombreMascota,
      Especie: especie,
      Raza: raza || null,
      Peso: peso || null,
      Edad: edad || null,
      Sexo: sexo,
      Categoria: categoria,
      Foto: fotoUrl || null,  // Enviamos la URL de la foto, ya sea subida o proporcionada
    };

    const result = await Mascota.crear(mascotaData);
    res.status(201).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

// Función para obtener las mascotas de un propietario
async function obtenerMascotasPorPropietario(req, res) {
  const { propietarioId } = req.params;

  try {
    const mascotas = await Mascota.obtenerPorPropietario(propietarioId);
    res.status(200).json(mascotas);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

// Función para actualizar una mascota
async function actualizarMascota(req, res) {
  const { propietarioId, nombreMascota, especie, raza, peso, edad, sexo, categoria } = req.body;
  let fotoUrl = req.body.fotoUrl;  // Tomamos la URL previa de la imagen si existe

  try {
    // Si se sube un archivo de imagen, sobrescribimos la URL de la foto
    if (req.file) {
      const imagePath = path.join(__dirname, '../../recursos/imgs-mascotas', req.file.filename);
      fotoUrl = `/imgs-mascotas/${req.file.filename}`;
    }

    const mascotaId = req.params.mascotaId;  // Obtenemos el ID desde la URL

    const mascotaData = {
      Mascota_ID: mascotaId,  // Usamos el ID de la URL
      Propietario_ID: propietarioId,
      Nombre_Mascota: nombreMascota,
      Especie: especie,
      Raza: raza || null,
      Peso: peso || null,
      Edad: edad || null,
      Sexo: sexo,
      Categoria: categoria,
      Foto: fotoUrl,  // Mantenemos la URL actual si no se ha subido una nueva imagen
    };

    console.log("Datos a actualizar:", mascotaData);  // Log para verificar los datos que pasan

    const result = await Mascota.actualizar(mascotaData);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}



// Función para eliminar una mascota
async function eliminarMascota(req, res) {
  try {
    const result = await Mascota.eliminar(req.params.Mascota_ID);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
}

module.exports = {
  crearMascota,
  obtenerMascotasPorPropietario,
  actualizarMascota,
  eliminarMascota
};
