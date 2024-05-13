const quizDAO = require('./quizDAO')
const quizModel = require('./quizModel')


const getquizByLessonIDAndUserID = (lessonID, userID, done)=>{
    quizDAO.getquizByLessonIDAndUserID(lessonID, userID, done)
}

const createQuiz = (lessonID, userID, done)=>{
    quizDAO.createQuiz(lessonID, userID, done)
}

const quizFound = (quiz)=>{
    if (quiz.length === 0) {
        return false
    }else{
        return true
    }
}

const getNumberOfQuestions = (quiz)=>{
    const levelsArray = quiz[0].levels
    if (levelsArray[4] === 5) {
        return "Quiz completed"
    }
    
    for (let index = 0; index < levelsArray.length; index++) {
        if (levelsArray[index] < 5) {
            const numberOfQuestions = 5 - levelsArray[index]
            return numberOfQuestions
        }
        
    }
}

const getLevelOfQuiz = (quiz)=>{
    const levelsArray = quiz[0].levels
    if (levelsArray[4] === 5) {
        return "Quiz completed"
    }
    console.log("levelsAraay:", levelsArray);
    
    for (let index = 0; index < levelsArray.length; index++) {
        if (levelsArray[index] < 5) {
            const level = index+1
            console.log(level);
            return level
        }
        
    }
}

const updateToNextLevel = (lessonID, userID, newLevels, done)=>{
    quizDAO.updateToNextLevel(lessonID, userID, newLevels, done)
}

const getCompletedQuiz = (userID, done)=>{
    quizDAO.getCompletedQuiz(userID, done) 
}

const getInProgressQuiz = (userID, done)=>{
    quizDAO.getInProgressQuiz(userID, done)
}

const getCompletedAndInProgrssQuiz = (userID, done)=>{
    quizDAO.getCompletedAndInProgrssQuiz(userID, done)
}

module.exports = {getquizByLessonIDAndUserID,quizFound, createQuiz, getNumberOfQuestions, getLevelOfQuiz, updateToNextLevel, getCompletedQuiz, getInProgressQuiz, getCompletedAndInProgrssQuiz}