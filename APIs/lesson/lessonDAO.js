const lessonModel = require('./lessonModel')

const getLessonsByYear = (year, done)=>{
    lessonModel.find({year: year}).sort({unit: 1}).then(res=>{
        // console.log(res);
        if (res.length == 0) {
            return done("No lessons found", undefined)
        }
        return done(undefined, res)
    }).catch(err=>{
        console.log(err);
        return done("errorr occured while retrieving lessons data", undefined)
    })
}

const searchLesson = (wordToSearch, year, done)=>{
    lessonModel.find({year: year,Title: {$regex: new RegExp(wordToSearch, 'i')}}).then(data=>{
        if (data.length === 0) {
            return done("No lessons found", undefined)
        }
        return done(undefined, data)
    }).catch(err=>{
        done("errorr occured while retrieving lessons data", undefined)
    })
}
module.exports = {getLessonsByYear, searchLesson}