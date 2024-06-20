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

const getCompletedQuiz = (userID, done)=>{
    const levels = [5,5,5,5,5]
    quizModel.aggregate([
        {$match: {userID: userID}},
        {$match: {levels: levels}}
    ]).then(data=>{
        // console.log(data);
        if (data.length === 0) {
            return done("No completed lessons found", undefined)
        }
        return done(undefined, data)
    })
    .catch(err=>{
        return done(err, undefined)
    })

}

const getInProgressQuiz = (userID, done)=>{
    const notStarted_Completed_levels = [[0,0,0,0,0], [5,5,5,5,5]]
    quizModel.aggregate([
        {$match: {userID: userID}},
        {$match: {levels: {$nin: notStarted_Completed_levels}}}
    ]).then(data=>{
        console.log(data);
        if (data.length === 0) {
            return done("No inprogress lessons found", undefined)
        }
        return done(undefined, data)
    }).catch(err=>{
        console.log(err);
        return done(err, undefined)
    })
}

const getCompletedAndInProgrssQuiz = (userID, done)=>{
    const inprogress_Completed_levels = [[5,0,0,0,0],[5,5,0,0,0],[5,5,5,0,0],[5,5,5,5,0],[5,5,5,5,5]]
    quizModel.aggregate([
        {$match: {userID: userID}},
        {$match: {levels: {$in: inprogress_Completed_levels}}}
    ]).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        done(err, undefined)
    })
}

module.exports = {getquizByLessonIDAndUserID, createQuiz, updateToNextLevel, getCompletedQuiz, getInProgressQuiz, getCompletedAndInProgrssQuiz}