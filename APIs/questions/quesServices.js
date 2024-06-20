const quesDAO = require('./quesDAO')



const getQuestionsByLessonAndLevel = (level, lessonID, done)=>{
    return quesDAO.getQuestionsByLessonAndLevel(level, lessonID, done)
}

module.exports = {getQuestionsByLessonAndLevel}