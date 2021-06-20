const { Doctor, validate } = require('../model/doctor');
const auth = require('../middleware/auth.js');
const _ = require('lodash');
const bcrypt = require('bcryptjs');
const mongoose = require('mongoose');
const express = require('express');
const router = express.Router();



router.get('/me', auth, async (req, res) => {
    const doctor = await Doctor.findById(req.user._id);
    var resp;
    if (!doctor) {
        resp = { status: 400, error: true, message: "Something went wrong" };
        return res.send(resp);

    }
    resp = {
        status: 200,
        error: false,
        message: "logged user information",
        data: {
            id: doctor.id,
            name: doctor.name,
            email: doctor.email,
            phone: doctor.phone,
            gender: doctor.gender,
            address: doctor.address,
            dateofcreation: doctor.dateofcreation,
            age: doctor.age

        }
    }
    res.send(resp);
})


router.post('/', async (req, res) => {
    const result = validate(req.body);
    var resp;
    if (result.error) {
        resp = { status: 400, error: true, message: result.error.details[0].message };
        return res.status(400).send(resp);
    }
    let doctor = await Doctor.findOne({ email: req.body.email });
    if (doctor) {
        resp = { status: 400, error: true, message: "user already registered" };

        return res.status(400).send(resp);
    }


    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    doctor = new Doctor({
        id: new mongoose.Types.ObjectId(),
        name: req.body.name,
        email: req.body.email,
        password: req.body.password,
        phone: req.body.phone,
        gender: req.body.gender,
        address: req.body.address,
        dateofcreation: date,
        age: req.body.age,
        specialisation: req.body.specialisation

    });

    const salt = await bcrypt.genSalt(10);
    doctor.password = await bcrypt.hash(doctor.password, salt);
    await doctor.save();

    resp = {
        status: 200,
        error: false,
        message: "Data send successfully",
        data: {

            id: doctor.id,
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

    res.send(resp);



})

// make get doctors .... 
// router.get('/',)
router.get('/',async(req,res)=>{
    const doctors = await Doctor.find();
    res.send(doctors);
})
module.exports = router;