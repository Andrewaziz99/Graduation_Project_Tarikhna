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

router.get('/search', (req, res)=>{
    console.log(req.query.wordToSearch);
    const wordToSearch = req.query.wordToSearch.trim()
    if (wordToSearch.length === 0) {
        return res.send({status: false, message:"You must enter the text to search for", data:null})
    }
    const year = req.claims.year
    try {
        lessonController.searchLesson(wordToSearch, year, (err, data)=>{
            if (err) {
                return res.send({status: false, message: err, data: null})
            }else{
                console.log(data);
                return res.send({status: true, message: "Lessons retrieved successfully", data: data})
            }
        })
    } catch (error) {
        return res.send({status: false, message: "Error has occured, please try again after some time", data: null})
    }
    
})

module.exports = router