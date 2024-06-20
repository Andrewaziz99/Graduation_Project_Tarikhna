const quesServices = require('../questions/quesServices')
const quesDAO = require('./quizDAO')
const quizServices = require('./quizServices')

const getQuiz = (lessonID,userID , done) => {
    console.log('userid: ', userID);

    quizServices.getquizByLessonIDAndUserID(lessonID, userID, (err, levels) => {
        if (err) {
            return done(err, null) 
        }

        //check if a quiz is found for a specific user in a specific lesson
        if (!quizServices.quizFound(levels)) {
            //create a quiz document in the database
            console.log("quiz must be created");
            quizServices.createQuiz(lessonID[0], userID, (err, data)=>{
                if (err) {
                    console.log(err);
                    console.log("error here");
                    done("error while creating the quiz", undefined)
                }
                levels.push(data)
                getQuizDetails(levels,lessonID, done)
                
                
            })

        }else{
            getQuizDetails(levels,lessonID, done)
        }
    })

}

const getQuizDetails = (levels, lessonID, done)=>{
    const levelOfQuiz = quizServices.getLevelOfQuiz(levels)

        //get number of questions for the quiz
        const numberOfQuestions = quizServices.getNumberOfQuestions(levels)

        const quizDetails = {levelOfQuiz: levelOfQuiz, numberOfQuestions: numberOfQuestions}


        //calling the function to retrieve questions for a specific lesson and a specific user
        quesServices.getQuestionsByLessonAndLevel(levelOfQuiz, lessonID, (err, data)=>{
            if (err) {
                if (levelOfQuiz === "Quiz completed") {
                    quizDetails.questions = []
                    return done(undefined, quizDetails)
                }
                return done(err, undefined)
            }else{
                quizDetails.questions = data
                return done(undefined, quizDetails)
            }
        })
}

const updateToNextLevel = (lessonID, userID, done)=>{
    quizServices.getquizByLessonIDAndUserID(lessonID,userID, (err, quiz)=>{
        if (err) {
            return done(err, undefined)
        }

        const levels = quiz[0].levels

        //get the level of the user in the quiz
        const levelOfUser = quizServices.getLevelOfQuiz(quiz)
        console.log(levelOfUser);
       
        //new levels array
        const newLevels = quiz[0].levels
        newLevels[levelOfUser-1] = 5

        //update levels array in the database
        quizServices.updateToNextLevel(lessonID,userID, newLevels, done)
    })
}




module.exports = { getQuiz, updateToNextLevel }
