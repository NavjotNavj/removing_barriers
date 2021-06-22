const{appointment} = require('../model/appointment');
const {Slots} = require('../model/slots');
const{User} = require('../model/user');
const{Doctor} = require('../model/doctor');
const auth = require('../middleware/auth.js');
const mongoose = require('mongoose');
const express = require('express');
const router = express.Router();

router.post('/',auth,async(req,res)=>{
    const user = await User.findById(req.user._id);
    var resp;

    let appointmentByUser = new appointment({
        userid:req.user._id,
        slotid:req.body.slotid,
        doctorid:req.body.doctorid,
        additionalrequirement:req.body.additionalrequirement

    })
    console.log(appointmentByUser);

    try {

        await appointmentByUser.save();
        resp = {
            status: 200,
            error: false,
            message: "Data send successfully",
            data: {
                userid:appointmentByUser.userid,
                slotid:appointmentByUser.slotid,
                doctorid:appointmentByUser.slotid,
                additionalrequirement:appointmentByUser.additionalrequirement,
                isConfirmedByDoctor:appointmentByUser.isConfirmedByDoctor,


            }
        }

        res.send(resp);

    }
    catch (e) {
        resp = "error occured";
        res.status(400).send(resp);
    }


})


router.get('/myappointment',auth,async(req,res)=>{
    const doctor = await Doctor.findById(req.user._id);
    console.log(doctor);
    const myappointments = await appointment
        .find({ doctorid: {$eq:doctor._id} });
    console.log(myappointments);
    res.send(myappointments);

})

router.put('/confirmationByDoctor',auth,async(req,res)=>{

    const appointmentofDoctor = await appointment.findById(req.body.appointmentid);
    appointmentofDoctor.isConfirmedByDoctor = true;
    const result =  await appointmentofDoctor.save();
    res.send(result);


})


module.exports  = router;