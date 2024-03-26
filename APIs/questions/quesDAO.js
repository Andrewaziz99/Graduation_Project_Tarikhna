const quesModel = require('./quesModel')

//This fuction takes the level, lessonID, and the number of questions to retrieve random number of questions 
const getQuestionsByLessonAndLevel = (level, lessonID, done)=>{
    // quesModel.find({level: level, lessonID: lessonID}).then(data=>{
    //     console.log(level);
    //     console.log(lessonID);
    //     console.log(data);
    // }).catch(err=>{
    //     console.log(err);
    // })
  

    quesModel.aggregate([
        {$match: {level: parseInt(level)}},
        {$match: {lessonID: lessonID}}
        ,{$sample: {size: 10}}
    ]).then(data=>{
        console.log(data);
        if (data.length ===0) {
            return done("No questions found", undefined)
        }else{
            return done(undefined, data)
        }
    }).catch(err=>{
        done(err, undefined)
    })
}

module.exports = {getQuestionsByLessonAndLevel}