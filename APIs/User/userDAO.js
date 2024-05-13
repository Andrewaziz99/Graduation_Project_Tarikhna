const { json } = require('body-parser')
const userDAO = require('./userDAO')
const users = require('./users.json')
const fs = require('fs')
const mongoose = require('mongoose')
const userModel = require('./userModel')

const findUser= (useremail,done)=>{
    userModel.findOne({email : useremail}).then(user=>{
        console.log(user);
        done(undefined, user)
        console.log(user);
    }).catch(error=>{
        console.log(error);
        done(error, undefined)
    })


}

const registerUser = (userDetails, done)=>{
    // users.push(userDetails)
    // fs.writeFileSync('User/users.json', JSON.stringify(users))
    // return done(undefined, userDetails)
    userModel.create(userDetails).then(user=>{
        done(undefined, user)
    }).catch(error=>{
        done(error, undefined)
    })
    
}

const nameUpdate = (userID, newName, done)=>{
    userModel.updateOne({_id: userID}, {$set: {name: newName}}).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        return done(err, undefined)
    })
}

const emailUpdate= (userID, newEmail, done)=>{
    userModel.updateOne({_id: userID}, {$set: {email: newEmail}}).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        return done(err, undefined)
    })
}

const yearUpdate= (userID, newYear, done)=>{
    userModel.updateOne({_id: userID}, {$set: {year: newYear}}).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        return done(err, undefined)
    })
}

const passUpdate= (userID, newPass, done)=>{
    userModel.updateOne({_id: userID}, {$set: {password: newPass}}).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        return done(err, undefined)
    })
}


const getUserPass = (userID, done)=>{
    userModel.findOne({_id: userID}, {password: true}).then(data=>{
        return done(undefined, data)
    }).catch(err=>{
        return done(err, undefined)
    })
}

module.exports = {findUser, registerUser, nameUpdate, emailUpdate, yearUpdate, getUserPass, passUpdate}

