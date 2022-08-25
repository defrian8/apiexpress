var express = require('express');
const verifyToken = require('../middleware').verifyToken;
var router = express.Router();

const memberController = require('../controllers').member;
const userController = require('../controllers').user;
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.get('/api/member', verifyToken.verifyToken, memberController.list);

router.post('/api/user/register', userController.register);
router.post('/api/user/login', userController.login);
router.delete('/api/user', userController.logout);
router.get('/api/user/token', userController.refreshToken);
module.exports = router;
