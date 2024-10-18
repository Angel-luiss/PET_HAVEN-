const nodemailer = require('nodemailer');

exports.sendEmail = async (req, res) => {
  const { to, subject, htmlContent } = req.body;

  // Configurar el transporte de Nodemailer
  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: '', // Tu dirección de correo electrónico
      pass: '', // La contraseña del correo o la contraseña de aplicación
    },
  });

  const mailOptions = {
    from: 'alfonsocarlos200@gmail.com',
    to: to, // El destinatario que recibes desde el frontend
    subject: subject, // El asunto del correo
    html: htmlContent, // El contenido HTML del correo
  };

  try {
    // Enviar el correo
    await transporter.sendMail(mailOptions);
    res.status(200).json({ message: 'Correo enviado exitosamente' });
  } catch (error) {
    console.error('Error al enviar el correo:', error);
    res.status(500).json({ message: 'Error al enviar el correo' });
  }
};
