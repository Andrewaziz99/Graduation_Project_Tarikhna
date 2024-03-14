const express = require('express')
const router = express.Router()
const lessonController = require('./lessonController')

router.get('/getLessons', (req,res)=>{
    console.log(req.claims);
    const userData = req.claims
    lessonController.getLessonsByYear(userData.year, (err,data)=>{
        if (err) {
            res.send({status: false, data: null, message: err})
        }else{
            res.send({status: true, data: data, message: "Lessons retrieved successfully"})
        }
    })



})

module.exports = router