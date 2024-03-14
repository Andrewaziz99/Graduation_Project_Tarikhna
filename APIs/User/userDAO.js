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

module.exports = {findUser, registerUser}

// findUser("sdsds",(err,res)=>{
//     console.log(res);

// })

// registerUser({
//     name: "Thomas",
//     email: "ththth@hob",
//     password: "1234"
// }, (err, res)=>{
//     if (err) {
//         console.log(err);
//     }else{
//         console.log(res);
//     }
// })