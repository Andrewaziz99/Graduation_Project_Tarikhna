const jwt = require('jsonwebtoken')
const config = require('../config')

const verifyUser = ({email, password}, userDetails)=>{
    if (email == userDetails.email && password == userDetails.password) {
        return true
    }else{
        return false
    }
}

const createJWT = (userData)=>{
    const payload = {
        "role": `user`,
        "id": `${userData.id}`,
        "name": `${userData.name}`,
        "email": `${userData.email}`,
        // "password": `${userData.password}`,
        "year": `${userData.year}`
    }

    const token = jwt.sign(payload, config.AUTH_SECRET)
    return token
}



module.exports = {verifyUser, createJWT}

