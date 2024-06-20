const mongoose = require('mongoose')

const questionSchema = mongoose.Schema({
    question: {
        type: String,
        required: [true, "please enter the question"]
    },
    choices: {
        type: [String],
        required: [true, "please enter the choices"]
    },
    correctAns: {
        type: Number,
        required: [true, "please enter the correct answer"]
    },
    level: {
        type: Number,
        required: [true, "please enter the level"]
    },
    lessonID: {type: String,
    required: [true, "please enter the lessonID"]}
})

module.exports = mongoose.model("questions", questionSchema)