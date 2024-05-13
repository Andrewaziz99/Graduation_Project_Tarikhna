const userDAO = require('./userDAO')

const findUser = (withPassword, email, done)=>{
    userDAO.findUser(withPassword, email, done)
}

const registerUser = (userDetails, done)=>{
    userDAO.registerUser(userDetails, done)
}

const nameUpdate = (userID, newName, done)=>{
    userDAO.nameUpdate(userID, newName, done)
}

const emailUpdate = (userID, newEmail,done)=>{
    userDAO.emailUpdate(userID, newEmail, done)
}

const passwordUpdate = (userID, newPass , done)=>{
    userDAO.passUpdate(userID, newPass, done)
}

const yearUpdate = (userID, newYear, done)=>{
    userDAO.yearUpdate(userID, newYear, done)
}

const getUserPass = (userID, done)=>{
    userDAO.getUserPass(userID, done)
}

const checkOldPass = (oldPass, currentPass)=>{
    if (oldPass === currentPass) {
        return true
    }else{
        return false
    }
}

module.exports = {findUser, registerUser, nameUpdate, emailUpdate, passwordUpdate, yearUpdate, getUserPass,checkOldPass }