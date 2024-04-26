const userServices = require('./userServices')

const findUser = (email, done)=>{
    userServices.findUser(email, done)
}

module.exports = {findUser}