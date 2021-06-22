const{appointment} = require('../model/appointment');
const {Slots} = require('../model/slots');
const{User} = require('../model/user');
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


module.exports  = router;