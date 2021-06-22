const Joi = require('joi');
const mongoose = require('mongoose');
const { Doctor, validate } = require('./doctor');
const slotsSchema = new mongoose.Schema({
    doctorid: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Doctor',
    },
    slotid: {
        type: String
    },
    timeslot:
    {
        type: String,
        required: true
    },
    isBooked:
    {
        type: Boolean,
        default: false
    }



})


const Slots = mongoose.model('Slots', slotsSchema);
function valid(slot) {
    const Schema = Joi.object({


        timeslot: Joi.string().required(),



    }).options({ abortEarly: false });
    return Schema.valid(slot);
}

exports.Slots = Slots;
exports.valid = valid;