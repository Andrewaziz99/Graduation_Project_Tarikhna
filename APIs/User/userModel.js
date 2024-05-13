const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: [true, "Please enter the name"]
    },
    email: {
        type: String,
        required: [true, "Please enter the email"]
    },
    password: {
        type: String,
        required: [true, "Please enter the password"]
    },
    year: {
        type: Number,
        required: [true, "Please enter the year"]
    }
})

module.exports = mongoose.model("users", userSchema)