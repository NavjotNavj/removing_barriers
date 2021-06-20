const { Slots, valid } = require('../model/slots');
const { Doctor, validate } = require('../model/doctor');
const auth = require('../middleware/auth.js');
const mongoose = require('mongoose');
const express = require('express');
const router = express.Router();


router.post('/', auth, async (req, res) => {
    const doctor = await Doctor.findById(req.user._id);
    const result = valid(req.body);

    var resp;

    let slot = new Slots({
        doctorid: doctor._id,
        slotid: new mongoose.Types.ObjectId(),
        timeslot: req.body.timeslot,

    })
    console.log(slot);

    try {

        await slot.save();
        resp = {
            status: 200,
            error: false,
            message: "Data send successfully",
            data: {
                doctorid: slot.doctorid,
                slotid: slot.slotid,
                timeslot: slot.timeslot,
                isBooked: slot.isBooked

            }
        }

        res.send(resp);

    }
    catch (e) {
        resp = "error occured";
        res.status(400).send(resp);
    }





})


router.get('/all', async (req, res) => {
    const slots = await Slots
        .find()
        .populate('doctorid')
        .select('doctorid slotid  timeslot');
    console.log(slots);
})

router.get('/', auth, async (req, res) => {
    const doctor = await Doctor.findById(req.user._id);
    const slots = await Slots
        .find({ doctorid: doctor._id });
    console.log(slots);
    res.send(slots);

})


module.exports = router;