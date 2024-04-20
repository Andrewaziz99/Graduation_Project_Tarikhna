require('./userRouter')
const userModel = require('./userModel')
// const { use } = require('./userRouter')
const userServices = require('./userServices')

const findUser = (email, done) => {
    userServices.findUser(email, done)
}

const userUpdate = async (userID, newName, newEmail, oldPass, newPass, newYear, done) => {
    let user = {
        name: false,
        email: false,
        password: false,
        year: false
    }
    if (newName.length !== 0) {
        try {
            await new Promise((resolve, reject) => {
                userServices.nameUpdate(userID, newName, (err, data) => {
                    if (err) {
                        reject(err);
                    } else {
                        user.name = true;
                        resolve();
                    }
                });
            });
        } catch (error) {
            return done(error, undefined);
        }
    }

    if (newEmail.length !== 0) {
        try {
            await new Promise((resolve, reject)=>{
                userServices.emailUpdate(userID, newEmail, (err, data)=>{
                    if (err) {
                        reject(err)
                    }else{
                        user.email = true
                        resolve()
                    }
                })
            })
        } catch (error) {
            return done(error, undefined)
        }
    }

    if (newYear.length !== 0) {
        try {
            await new Promise((resolve, reject)=>{
                userServices.yearUpdate(userID, newYear, (err, data)=>{
                    if (err) {
                        reject(err)
                    }else{
                        user.year = true
                        resolve()
                    }
                })
            })
        } catch (error) {
            return done(error, undefined)
        }
    }

    if (newPass !== 0) {
        if (oldPass.length === 0) {
            return done("You must enter the old password")
        }
        try {
            const currentPass = await new Promise((resolve, reject)=>{
                userServices.getUserPass(userID, (err, data)=>{
                    if (err) {
                        reject(err)
                    }else{
                        resolve(data.password)
                    }

                })
            })

            if (userServices.checkOldPass(oldPass, currentPass)) {
                await new Promise((resolve, reject)=>{
                    userServices.passwordUpdate(userID, newPass, (err, data)=>{
                        if (err) {
                            reject(err)
                        }else{
                            user.password = true
                            resolve()
                        }
                    })
                })
            }else{
                return done("Wrong password", undefined)
            }
        } catch (error) {
            return done(error, undefined)
        }
    }

    return done(undefined, user);
}

module.exports = { findUser, userUpdate }
