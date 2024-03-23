const lessonDAO = require('./lessonDAO')

const getLessonsByYear = (year, done)=>{
    lessonDAO.getLessonsByYear(year, done)
}

const searchLesson = (wordToSearch, year, done)=>{
    lessonDAO.searchLesson(wordToSearch, year,done)
}

module.exports = {getLessonsByYear, searchLesson}