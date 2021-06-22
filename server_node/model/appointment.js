const mongoose = require('mongoose');
const {Slots,valid} = require('./slots');
const {User, validate} = require('./user');
const {Doctor,validate} = require('./doctor');
const appointmentSchema =  new mongoose.Schema({

    userid:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User'
    },
    doctorid:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Doctor',
    },
    slotid:{
        type:String
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
