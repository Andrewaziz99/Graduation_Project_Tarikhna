const quesServices = require('./quesServices')
const lessonServices = require('../lesson/lessonServices')

const getAllQuestions = ()=>{
    return new Promise((resolve, reject)=>{
        quesServices.getAllQuestions((error, questions)=>{
            if (error) {
                reject(error)
            }else{
                resolve(questions)
            }
        })
    })
} 

const getAllLessons = ()=>{
    return new Promise((resolve, reject)=>{
        lessonServices.getAllLessons((error, lessons)=>{
            if (error) {
                reject(error)
            }else{
                resolve(lessons)
            }
        })
    })
}

const getQuestionsWithLessonTitles = async (done) => {
    try {
        let questionsWithLessonTitles = []
        let questions = await getAllQuestions()
        const lessons = await getAllLessons()
        questions.map(question => {
            console.log(question);
            const questionWithLessonTitle = {
                    '_id': question._id,
                    'question': question.question,
                    'choices': question.choices,
                    'correctAns': question.correctAns,
                    'level': question.level,
                    'lessonID': question.lessonID,
                    'lessonTitle': null,
                    'year': null
            }
            for (const lesson of lessons) {
                if (question.lessonID == lesson.id) {
                    questionWithLessonTitle.lessonTitle = lesson.Title
                    questionWithLessonTitle.year = lesson.year
                    questionsWithLessonTitles.push(questionWithLessonTitle)
                }
            }
        })
        console.log(questionsWithLessonTitles);

        return done(undefined, questionsWithLessonTitles)
    } catch (error) {
        return done(error, undefined)
    }
}

const updateQuestion = (updatedQuestion, done)=>{
    quesServices.updateQuestion(updatedQuestion, done)
}

const addQuestion = (questionData, done)=>{
    quesServices.addQuestion(questionData, done)
}

const deleteQuestion = (questionID, done)=>{
    quesServices.deleteQuestion(questionID, done)
}


module.exports = {getQuestionsWithLessonTitles, updateQuestion, addQuestion, deleteQuestion}