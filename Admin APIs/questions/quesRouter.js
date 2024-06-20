const express = require('express')
const router = express.Router()
const quesController = require('./quesController')

//Get all questions from the database
router.get('/getAllQuestions',async (req, res)=>{
    try {
        quesController.getQuestionsWithLessonTitles((err, questions)=>{
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Questions retrieved successfully", data: questions })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }
})

router.put('/editQuestion', (req, res)=>{
    try {
        console.log(req.body);
        const updatedQuestion = req.body
        quesController.updateQuestion(updatedQuestion, (err, data)=>{
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Questions updated successfully", data: data })

        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
        
    }
})

router.post('/addQuestion', (req, res)=>{
    try {
        console.log(req.body);
        const questionData = req.body
        quesController.addQuestion(questionData, (err, data)=>{
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Questions added successfully", data: data })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }
})

router.delete('/deleteQuestion', (req, res)=>{
    try {
        console.log(req.query.questionID);
        const questionID = req.query.questionID
        quesController.deleteQuestion(questionID, (err, data)=>{
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Questions deleted successfully", data: data })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
        
    }
})
module.exports = router