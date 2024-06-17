const express = require('express')
const router = express.Router()
const lessonController = require('./lessonController')

//get all the lessons of a sprcefic academic year
router.get('/getLessons', (req, res) => {
    console.log(req.claims);
    const userData = req.claims
    lessonController.getLessonsByYear(userData.year, (err, data) => {
        if (err) {
            res.send({ status: false, data: null, message: err })
        } else {
            res.send({ status: true, data: data, message: "Lessons retrieved successfully" })
        }
    })

})

//search for lesson
//The request should contain the word to search for
router.get('/search', (req, res) => {
    console.log(req.query.wordToSearch);
    const wordToSearch = req.query.wordToSearch.trim()
    if (wordToSearch.length === 0) {
        return res.send({ status: false, message: "You must enter the text to search for", data: null })
    }
    const year = req.claims.year
    try {
        lessonController.searchLesson(wordToSearch, year, (err, data) => {
            if (err) {
                return res.send({ status: false, message: err, data: null })
            } else {
                console.log(data);
                return res.send({ status: true, message: "Lessons retrieved successfully", data: data })
            }
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }

})

//Filter Lessons
//The request should contain the status of lessons to be filtered,
// This should be one of three values: 1-> not started lessons, 2-> in progress lessons, 3-> completed lessons
router.get('/filter', (req, res) => {
    console.log(req.query.filter);
    const filter = req.query.filter
    const year = req.claims.year
    const userID = req.claims.id
    if (filter.length === 0) {
        return res.send({ status: false, message: "You must enter the status of the lesson", data: null })
    }
    try {
        lessonController.lessonFilteration(filter, year, userID, (err, data) => {
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Lessons filtered successfully", data: data })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })

    }

})

module.exports = router