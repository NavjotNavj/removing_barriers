const mongoose = require('mongoose');
const {Slots,valid} = require('./slots');
const {User} = require('./user');
const {Doctor} = require('./doctor');
const appointmentSchema =  new mongoose.Schema({

    userid:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User'
    },
    slotid:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Slots'
    },
    doctorid:
    {
        type:mongoose.Schema.Types.ObjectId,
        ref:'Doctor'

    },
    isConfirmedByDoctor:
    {
        type:Boolean,
        default:false
    },
    additionalrequirement:
    {
        type:String
    }
})


const appointment = mongoose.model('appointment', appointmentSchema);
exports.appointment = appointment;
