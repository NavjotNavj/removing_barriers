const Joi = require('joi');
const mongoose = require('mongoose');
const {Doctor,validate} = require('./doctor');
const slotsSchema =  new mongoose.Schema({
    id:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Doctor',
    }
,
    timeslot:
    {
        type:String,
        required:true
    },
    iBooked:
    {
        type:Boolean,
        default:false
    }
    


})


const Slots = mongoose.model('Slots', slotsSchema);
function validate(user)
{
    const Schema = Joi.object({

        id:Joi.string(),
        timeslot:Joi.string().required(),


       
    }).options({abortEarly:false});
    return Schema.validate(user);
}

exports.Slots = Slots;
exports.validate = validate;