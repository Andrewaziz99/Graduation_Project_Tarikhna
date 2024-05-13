const AI_Services = require('./AI_Services')

const summarizeText = (historicalTest, done)=>{
    AI_Services.summarizeText(historicalTest, done)
}

const saveSummarizedItem = (data, done)=>{
    AI_Services.saveSummarizedItem(data, done)
}

const getAllSavedItems = (userID,done)=>{
    AI_Services.getAllSavedItems(userID,done)
}

module.exports = {summarizeText, getAllSavedItems, saveSummarizedItem}