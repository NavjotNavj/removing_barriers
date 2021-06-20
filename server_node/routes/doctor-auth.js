const { Doctor } = require('../model/doctor');
const mongoose = require('mongoose');
const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const Joi = require('joi');
const router = express.Router();
router.post('/', async (req, res) => {
    var resp;
    const result = validateUser(req.body);
    if (result.error) {
        resp = { status: 400, error: true, message: result.error.details[0].message }
        return res.status(400).send(resp);
    }
    let doctor = await Doctor.findOne({ email: req.body.email });
    if (!doctor) {
        resp = { status: 400, error: true, message: "Invalid email or password" }
        return res.status(400).send(resp);
    };

    const validpassword = bcrypt.compareSync(req.body.password, doctor.password);
    if (!validpassword) {

        resp = { status: 400, error: true, message: "Invalid email or password" }
        return res.status(400).send(resp);

    }

    resp = {
        status: 200,
        error: false,
        message: "Logged in successfully",
        data: {
            token: doctor.generateAuthtoken(),
            name: doctor.name,
            email: doctor.email,
            phone: doctor.phone,
            gender: doctor.gender,
            address: doctor.address,
            dateofcreation: doctor.dateofcreation,
            age: doctor.age,
            specialisation: doctor.specialisation


        }

    }

    const token = doctor.generateAuthtoken();

    res.header('x-auth-token', token).send(resp);

})



function validateUser(req) {
    const Schema = Joi.object({

        email: Joi.string().min(5).max(50).required().email(),
        password: Joi.string().min(5).max(20).required(),

    }).options({ abortEarly: false });
    return Schema.validate(req);
}

module.exports = router;