const AI_Services = require('./AI_Services')

const summarizeText = (historicalTest, done)=>{
    AI_Services.summarizeText(historicalTest, done)
    // console.log(historicalTest);
    // done("Ther is an error here", undefined)
}

const saveSummarizedItem = (data, done)=>{
    AI_Services.saveSummarizedItem(data, done)
}

const getAllSavedItems = (done)=>{
    AI_Services.getAllSavedItems(done)
}

module.exports = {summarizeText, getAllSavedItems, saveSummarizedItem}