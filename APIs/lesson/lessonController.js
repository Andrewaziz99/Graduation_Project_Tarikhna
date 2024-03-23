const lessonServices = require('./lessonServices')

const getLessonsByYear = (year, done)=>{
    lessonServices.getLessonsByYear(year, done)
}

const searchLesson = (wordToSearch, year, done)=>{
    lessonServices.searchLesson(wordToSearch, year,done)
}

module.exports = {getLessonsByYear, searchLesson}
