const quesModel = require('./quesModel')


//Get all the questions 
const getAllQuestions = (done) => {
    quesModel.find().then(questions => {
        if (questions.length == 0) {
            return done("No questions found", undefined)
        }
        return done(undefined, questions)

    }).catch(error => {
        return done(error, undefined)
    })
}

const updateQuestion = (updatedQuestion, done)=>{
    quesModel.updateOne({_id: updatedQuestion.questionID}, {question: updatedQuestion.question, choices: updatedQuestion.choices, correctAns: updatedQuestion.correctAns, level: updatedQuestion.level, lessonID: updatedQuestion.lessonID}).then(res=>{
        return done(undefined, res)
    }).catch(error=>{
        return(error, undefined)
    })
}

const addQuestion = (questionData, done)=>{
    quesModel.create({question: questionData.question, choices: questionData.choices, correctAns: questionData.correctAns, level: questionData.correctAns, lessonID: questionData.lessonID}).then(res=>{
        return done(undefined, res)
    }).catch(error=>{
        return done(error, undefined)
    })
}

const deleteQuestion = (questionID, done)=>{
    quesModel.deleteOne({_id: questionID}).then(res=>{
        if (res.deletedCount == 0) {
            return done('The question has not been deleted')
        }
        return done(undefined, res)
    }).catch(error=>{
        return done(error, undefined)
    })
}

module.exports = {getAllQuestions, updateQuestion, addQuestion, deleteQuestion}