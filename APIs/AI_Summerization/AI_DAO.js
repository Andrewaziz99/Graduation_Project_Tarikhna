const mongoose = require('mongoose')
const AI_SummarizedTextModel =  require('./AI_SummarizedTextModel')

const saveSummarizedItem = (data,done)=>{
    AI_SummarizedTextModel.create(data).then(data=>{
        console.log(data);
        done(undefined, data)
    }).catch(error=>{
        console.log(error);
        done(error, undefined)
    })
}

const getAllSavedItems = (done)=>{
    AI_SummarizedTextModel.find().then(data=>{
        console.log(data);
        return done(undefined, data)
    }).catch(err=>{
        console.log(err);
        return done(err, undefined)
    })
}

module.exports = {getAllSavedItems, saveSummarizedItem}