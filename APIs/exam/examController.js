const quesServices = require('../questions/quesServices')

const getExamQuestions = (level, lessonsIDs, done)=>{
    return quesServices.getQuestionsByLessonAndLevel(level, lessonsIDs, done)
}

module.exports = {getExamQuestions}