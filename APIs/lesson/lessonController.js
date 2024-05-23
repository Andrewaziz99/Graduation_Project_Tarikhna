const lessonServices = require('./lessonServices')
const quizServices = require('../quiz/quizServices')
const { getInProgressQuiz } = require('../quiz/quizDAO')

const getLessonsByYear = (year, done)=>{
    lessonServices.getLessonsByYear(year, done)
}

const searchLesson = (wordToSearch, year, done)=>{
    lessonServices.searchLesson(wordToSearch, year,done)
}

const lessonFilteration = (status, year, userID, done)=>{
    console.log("the stastus is " + status);
    lessonServices.getLessonsByYear(year, (err, allLessons)=>{
        // console.log(data);
        if (err) {
            return done(err, undefined)
        }

        switch (Number(status)) {
            case 3:
                 quizServices.getCompletedQuiz(userID, (completedQuizError, completedQuiz)=>{
                    if (completedQuizError) {
                        return done(completedQuizError, undefined)
                    }
                    return done(undefined, lessonServices.lessonFilteration(1, allLessons, completedQuiz))
                })
                break;
            
            case 2:
                quizServices.getInProgressQuiz(userID, (InProgressQuizError,InProgressQuiz)=>{
                    if (InProgressQuizError) {
                        return done(InProgressQuizError, undefined)
                    }
                    return done(undefined, lessonServices.lessonFilteration(0.5, allLessons, InProgressQuiz))
                })
                break;
            default:
                quizServices.getCompletedAndInProgrssQuiz(userID, (CompletedAndInProgrssQuizError, CompletedAndInProgrssQuiz)=>{
                    if (CompletedAndInProgrssQuizError) {
                        return done(CompletedAndInProgrssQuizError, undefined)
                    }
                    const notStartedLessons = lessonServices.lessonFilteration(0, allLessons, CompletedAndInProgrssQuiz)
                    if (notStartedLessons.length === 0) {
                        return done("There are no not started lessons left to explore",undefined)
                    }
                    return done(undefined, notStartedLessons)
                })
                break;
        }
        
        // console.log(quizServices.getCompletedQuiz(userID));
    })
}

const getAllLessons = (done)=>{
    lessonServices.getAllLessons(done)
}

const addLesson = (data, done)=>{
    lessonServices.addLesson(data, done)
}

module.exports = {getLessonsByYear, searchLesson, lessonFilteration, getAllLessons, addLesson}
