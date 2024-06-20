const lessonDAO = require('./lessonDAO')


const getAllLessons = (done)=>{
    lessonDAO.getAllLessons(done)
}

const addLesson = (data, done)=>{
    lessonDAO.addLesson(data, done)
}

const deleteLesson = (lessonID, done)=>{
    lessonDAO.deleteLesson(lessonID, done)
}

const updateLesson = (lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, done)=>{
    lessonDAO.updateLesson(lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, done)
}
module.exports = {getAllLessons, addLesson,deleteLesson, updateLesson}