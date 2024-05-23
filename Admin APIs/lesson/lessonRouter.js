const express = require('express')
const router = express.Router()
const lessonController = require('./lessonController')
const multer = require('multer')




//Admin
//Show all lessons
router.get('/getAllLessons', (req, res) => {
    try {
        lessonController.getAllLessons((err, lessons) => {
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }

            return res.send({ status: true, message: "Lessons retrieved successfully", data: lessons })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })

    }
})

//Admin
//Add Lesson
router.post('/addLesson', (req, res) => {
    console.log(req.body);
    try {
        lessonController.addLesson(req.body, (err, lesson) => {
            if (err) {
                console.log(res);
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Lesson added successfully", data: lesson })
        })
    } catch (error) {
        console.log(error);
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })

    }
})


//upload pdf and summarize its content
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './uploads')
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = "pdfFile"
        cb(null, uniqueSuffix)
    }
})

const upload = multer({ storage: storage })
router.post('/uploadPdf', upload.single('file'), (req, res) => {
    console.log("here in add pdf rputer");
    console.log(req.body);
    try {
        lessonController.pdf_summarize('./uploads/pdfFile', (err, data) => {
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "pdf summarized successfully", data: data })

        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }
    
    // console.log(req);
})

//delete lesson
router.delete('/deleteLesson/', (req, res) => {
    try {
        const lessonID = req.query.id
        lessonController.deleteLesson(lessonID, (err, data) => {
            if (err) {
                console.log(err);
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Lessons deleted successfully", data: data })
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }

})

//edit lesson
router.put('/editLesson', (req, res)=>{
    console.log(req.body);
    try {
        lessonController.updateLesson(req.body.lessonID, req.body.lessonTitle, req.body.lessonUnit, req.body.lessonGrade,req.body.characters, req.body.dates, (err, data)=>{
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            return res.send({ status: true, message: "Lesson updated successfully", data: data })
    
        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }
    
})

module.exports = router