const mongoose = require('mongoose')

// const AI_SummarizedTextSchema  = mongoose.Schema({
//     name: {type: String, required: true},
//     age: {type: Number, required: true}
// })


const characterSchema = mongoose.Schema({
    nameOfCharacter: { type: String, required: true },
    Events: { type: [String], required: true }
});

const dateSchema = mongoose.Schema({
    date: { type: String, required: true },
    event: { type: [String], required: true }
});

const AI_SummarizedTextSchema = mongoose.Schema({
    // historicalORNot: { type: Boolean, required: true },
    characters: { type: [characterSchema], required: true },
    dates: { type: [dateSchema], required: true },
    Title: { type: String, required: true },
    userID: {type: String, required: true}
});
const AI_SummarizedTextModel = mongoose.model("ai_summarizedtexts", AI_SummarizedTextSchema);

module.exports = AI_SummarizedTextModel;