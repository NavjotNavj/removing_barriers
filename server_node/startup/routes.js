const users = require('../routes/users');
const auth = require('../routes/auth');
const doctor = require('../routes/doctors');
const doctorauth = require('../routes/doctor-auth');
const slots = require('../routes/slots');
const cors = require('cors');
const bodyParser = require('body-parser');
const multer = require('multer');
const upload = multer();

const express = require('express');
module.exports = function (app) {
    app.use(express.json());
    app.use(cors());
    app.use(bodyParser.urlencoded({ extended: true }));
    app.use(upload.array());


    app.use('/user', users);
    app.use('/auth', auth);
    app.use('/doctor', doctor);
    app.use('/doctorauth', doctorauth);
    app.use('/slots',slots);





}