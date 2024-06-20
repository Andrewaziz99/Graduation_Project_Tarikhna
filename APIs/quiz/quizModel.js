const mongoose = require('mongoose')

const quizSchema = mongoose.Schema({
    levels: {
        type: [Number],
        required: [true, "please enter the levels array"]
    },
    lessonID: {
        type: String,
        required: [true, "please enter the lesson id"]
    },
    userID: {
        type: String,
        required: [true, "please enter the userID"]
    }
})

module.exports = mongoose.model("quizes", quizSchema)