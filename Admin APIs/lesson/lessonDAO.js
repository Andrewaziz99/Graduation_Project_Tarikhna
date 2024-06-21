const lessonModel = require('./lessonModel')

const getAllLessons = (done)=>{
    lessonModel.find().then(res=>{
        if (res.length == 0) {
            return done("No lessons found", undefined)
        }
        return done(undefined, res)
    }).catch(err=>{
        return done(err, undefined)
    })
}

const addLesson = (data, done)=>{
    lessonModel.create(data).then(res=>{
        return done(undefined, res)
    }).catch(err=>{
        return done(err, undefined)
    })
}


//delete lesson by id
const deleteLesson = (lessonID, done)=>{
    lessonModel.deleteOne({_id: lessonID}).then(res=>{
        return done(undefined, res)
    }).catch(error=>{
        return done(error, undefined)
    })
}

const updateLesson = (lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, AR_Text, done)=>{
    lessonModel.updateOne({_id: lessonID}, {Title: lessonTitle, unit: lessonUnit, year: lessonGrade, characters: characters, dates: dates, AR_Text:AR_Text}).then(res=>{
        console.log(res);
        return done(undefined, res)
    }).catch(error=>{
        console.log(error);
        return done(error, undefined)
    })
}
module.exports = {getAllLessons, addLesson, deleteLesson, updateLesson}