const lessonDAO = require('./lessonDAO')

const getLessonsByYear = (year, done)=>{
    lessonDAO.getLessonsByYear(year, done)
}

module.exports = {getLessonsByYear}