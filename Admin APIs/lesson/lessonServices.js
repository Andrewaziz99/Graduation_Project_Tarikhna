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

const updateLesson = (lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, AR_Text,  done)=>{
    lessonDAO.updateLesson(lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, AR_Text, done)
}
module.exports = {getAllLessons, addLesson,deleteLesson, updateLesson}