const express = require('express');
const router = express.Router();
const sendMail = require('../mail');

router.post('/send-email', async (req, res) => {
  const { email, subject, message } = req.body;

  try {
    await sendMail(email, subject, message);
    res.status(200).json({ message: 'Correo enviado con éxito' });
  } catch (error) {
    res.status(500).json({ error: 'Error enviando el correo' });
  }
});

module.exports = router;