const lessonServices = require('./lessonServices')

const getLessonsByYear = (year, done)=>{
    lessonServices.getLessonsByYear(year, done)
}

module.exports = {getLessonsByYear}
