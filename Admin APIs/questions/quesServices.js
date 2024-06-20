const quesDAO = require('./quesDAO')


const getAllQuestions = (done)=>{
    quesDAO.getAllQuestions(done)
}

const updateQuestion = (updatedQuestion, done)=>{
    quesDAO.updateQuestion(updatedQuestion, done)
}

const addQuestion = (questionData, done)=>{
    quesDAO.addQuestion(questionData, done)
}

const deleteQuestion = (questionID, done)=>{
    quesDAO.deleteQuestion(questionID, done)
}

module.exports = {getAllQuestions, updateQuestion, addQuestion, deleteQuestion}