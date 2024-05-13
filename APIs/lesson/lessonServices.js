const lessonDAO = require('./lessonDAO')

const getLessonsByYear = (year, done)=>{
    lessonDAO.getLessonsByYear(year, done)
}

const searchLesson = (wordToSearch, year, done)=>{
    lessonDAO.searchLesson(wordToSearch, year,done)
}

const lessonFilteration = (status, allLessons, filteredQuizes)=>{
    console.log(filteredQuizes);
    const completedLessons =  allLessons.filter((lesson)=>{
        if (status === 0) {
            const completedOrNot = filteredQuizes.find(quiz=> quiz.lessonID == lesson._id)
            if (completedOrNot === undefined) {
                return lesson
            }
        }else{
            const completedOrNot = filteredQuizes.find((quiz)=>{
                if (quiz.lessonID == lesson._id) {
                    return true
                }
            })
            if (completedOrNot) {
                return lesson
            }
        }        
    })
    return completedLessons
}

module.exports = {getLessonsByYear, searchLesson, lessonFilteration}