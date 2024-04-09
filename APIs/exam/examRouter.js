const express = require('express')
const router = express.Router()
const examController = require('./examController')

router.get('/', (req, res)=>{
    const level = req.query.level
    const lessonsIDs = JSON.parse(req.query.lessonID) 
    try {
        examController.getExamQuestions(level, lessonsIDs, (err, data)=>{
            console.log(data);
            if (err) {
                return res.status(200).send({status: false, message: err, data: null})
            }
            return res.status(200).send({status: true, message: "Questions retrieved successfully", data: data})
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }
})

module.exports = router

