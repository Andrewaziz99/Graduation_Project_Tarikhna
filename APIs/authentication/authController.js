const authServices = require('./authServices')
const userServices = require('../User/userServices')

const registerUser = (userData, done)=>{
    userServices.findUser(userData.email, (err, userfound)=>{

        if (err) {
            return done(err)
        }else{
            if (userfound) {
                return done("email already existed", undefined)
            }else{
                userServices.registerUser(userData, done)
            }
        }
    })
}

const loginUser = ({email, password}, done)=>{
    userServices.findUser(email, (err,userFound)=>{
        if (err) {
            return done(err)
        }else{
            if (userFound) {
               const userVerified = authServices.verifyUser({email, password}, userFound)
               if (userVerified) {
                const jwt = authServices.createJWT(userFound)
                const data = {
                    id: userFound.id,
                    name: userFound.name,
                    email: userFound.email,
                    year: userFound.year,
                    token: jwt
                }

                return done(undefined, data)
               }else{
                return done("Incorrect email or password", undefined)
               }
            }
            return done("Incorrect email or password", undefined)
        }
    })
}

module.exports = {registerUser, loginUser}