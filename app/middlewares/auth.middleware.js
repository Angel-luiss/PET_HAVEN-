const jwt = require('jsonwebtoken');

const secretKey = 'supersecretkey';

function verifyToken(req, res, next) {
  const token = req.headers['x-access-token'];
  
  if (!token) {
    return res.status(403).json({ message: 'Token no proporcionado' });
  }

  jwt.verify(token, secretKey, (err, decoded) => {
    if (err) {
      return res.status(500).json({ message: 'Token inválido' });
    }
    
    req.userId = decoded.id;
    req.userRol = decoded.rol;
    next();
  });
}

module.exports = { verifyToken };
