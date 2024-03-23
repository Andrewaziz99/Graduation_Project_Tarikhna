const OpenAI = require('openai')
const AI_DAO = require('./AI_DAO')
const config = require('../config')


const summarizeText = async (historicalTest, done) => {
    const openai = new OpenAI({
        apiKey: config.API_KEY
    })
    const jsonFormat = "extract all the characters in this text and all the events related to the characters and also all the dates and its events and given a title to the text in a json format like this :{ 'historicalORNot': /*boolean value if the text related to historical events*/, 'data': {characters': [{ 'nameOfCharacter': /*name of the character*/, 'Events': /*All events related to the character*/ }], 'dates': [{ 'date': /*The date*/, 'event': /*the event related to the date*/ }], 'Title': /*related title to the text*/ }}"
    historicalTest = JSON.stringify(historicalTest)

    try {
        const response = await openai.chat.completions.create({
            model: 'gpt-3.5-turbo-0125',
            response_format: { type: "json_object" },
            messages: [{ "role": "user", "content": historicalTest + jsonFormat }],
            max_tokens: 1000
        })
        return done(undefined, JSON.parse(response.choices[0].message.content))
        // responseInJSON = JSON.parse(response.choices[0].message.content)
        // console.log(responseInJSON.choices[0].message.content.historicalORNot);
        // if (response.choices[0].message.content.historicalORNot) {
        //     return done(undefined, response.choices[0].message.content)
        // }else{
        //     return done("This text is not related to history", undefined)
        
        // }
        console.log(response.choices[0].message.content);

    } catch (error) {
        done(error, undefined)
    }

}

const saveSummarizedItem = (data, done)=>{
    AI_DAO.saveSummarizedItem(data, done)
}

const getAllSavedItems = (userID,done)=>{
    AI_DAO.getAllSavedItems(userID, done)
}

module.exports = {summarizeText, getAllSavedItems, saveSummarizedItem}