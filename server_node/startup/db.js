const mongoose = require('mongoose');
const uri = "mongodb+srv://Muskan:muskan1105@cluster0.tmgr3.mongodb.net/majorproject?retryWrites=true&w=majority";
module.exports = function()
{
    // const connection = "mongodb+srv://Muskan:muskan1105@cluster0.tmgr3.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
    mongoose
    .connect(uri,{ useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log("Database Connected Successfully ... hurray "))
    .catch(err => console.log(err));
}
