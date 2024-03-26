const quizModel = require('./quizModel')

const getquizByLessonIDAndUserID = (lessonID, userID, done)=>{
    quizModel.find({lessonID: lessonID, userID: userID}).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        return done(err, undefined)
    })
}

const createQuiz = (lessonID, userID, done)=>{
    const levels = [0,0,0,0,0]
    quizModel.create({levels: levels,lessonID: lessonID,userID: userID}).then(data=>{
        done(undefined, data)
    }).catch(err=>{
        done(err, undefined)
    })
}

const updateToNextLevel = (lessonID, userID, newLevels, done)=>{
    console.log("new: ", newLevels);
    quizModel.updateOne({lessonID: lessonID, userID: userID}, {$set: {levels: newLevels}}).then(data=>{
        done(undefined, data)
    }).catch(err=>{
        done(err, undefined)
    })
}

module.exports = {getquizByLessonIDAndUserID, createQuiz, updateToNextLevel}