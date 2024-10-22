// backend/mail.js

const nodemailer = require('nodemailer');

const sendMail = async (to, subject, message) => {
  const transporter = nodemailer.createTransport({
    service: 'gmail', // O el proveedor que estés usando
    auth: {
      user: 'pet.heaven.guau@gmail.com', // Cambia esto con tu correo
      pass: 'tu-contraseña' // Cambia esto con tu contraseña de aplicación
    },
  });

  const mailOptions = {
    from: 'tu-correo@gmail.com',
    to,
    subject,
    text: message,
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    console.log('Correo enviado: ' + info.response);
  } catch (error) {
    console.error('Error enviando el correo:', error);
    throw new Error('No se pudo enviar el correo');
  }
};

module.exports = sendMail;
