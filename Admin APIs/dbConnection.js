const mongoose = require('mongoose')
const config = require('./config')

const connectDb = ()=>{
    try {
        mongoose.connect(config.CONNECTION_STRING).then(res => {
            console.log("Connected to db successfully");
        }).catch(err => {
            console.log(err);
        })
    } catch (error) {
        console.log(error);
        return error
    }
}

module.exports = connectDb

connectDb()

