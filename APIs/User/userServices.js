const userDAO = require('./userDAO')

const findUser = (email, done)=>{
    userDAO.findUser(email, done)
}

const registerUser = (userDetails, done)=>{
    userDAO.registerUser(userDetails, done)
}

module.exports = {findUser, registerUser}