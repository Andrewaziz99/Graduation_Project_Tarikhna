const express = require('express')
const router = express.Router()
const quesServices = require('../questions/quesServices')
const quizController = require('./quizController')

router.get('/', (req, res) => {
    const lessonID = req.query.lessonID
    const userData = req.claims
    try {
        quizController.getQuiz(lessonID,userData.id, (err, data) => {
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            if (data.questions.length === 0) {
                return res.send({ status: true, message: "Quiz Completed", data: data })
            }
            return res.send({ status: true, message: "questions retrieved successfully", data: data })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })

    }


})

router.put('/updateToNextLevel', (req, res)=>{
    const userDetails = req.claims
    const lessonID = req.query.lessonID
    quizController.updateToNextLevel(lessonID, userDetails.id,(err, data)=>{
        if (err) {
            return res.send({status: false, message: err, data: null})
        }
        return res.send({status: true, message: "updated successfully", data: data})
    })
})

module.exports = router