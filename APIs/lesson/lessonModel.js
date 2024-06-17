const mongoose = require('mongoose')

const characterSchema = mongoose.Schema({
    nameOfCharacter: { type: String, required: true },
    Events: { type: [String], required: true }
});

const dateSchema = mongoose.Schema({
    date: { type: String, required: true },
    event: { type: [String], required: true }
});

const summarizeLessonSchema = mongoose.Schema({
    characters: { type: [characterSchema], required: true },
    dates: { type: [dateSchema], required: true },
    Title: { type: String, required: true },
    unit: {type: Number, required: true},
    year: {type: Number, required: true},
    AR_Text: {type: String, required: true}
});

const summarizedLessonModel = mongoose.model('lessons', summarizeLessonSchema)

module.exports = summarizedLessonModel;