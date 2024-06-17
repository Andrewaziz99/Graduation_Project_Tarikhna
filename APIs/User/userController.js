const userServices = require('./userServices')
const authServices = require('../authentication/authServices')

const findUser = (withPassword, email, done)=>{
    userServices.findUser(withPassword, email, done)
}

const userUpdate = async (currentUserData, userID, newName, newEmail, oldPass, newPass, newYear, done) => {
    if (newName != null && newName.length != 0) {
        try {
            await new Promise((resolve, reject) => {
                userServices.nameUpdate(userID, newName, (err, data) => {
                    if (err) {
                        reject(err);
                    } else {
                        currentUserData.name = newName;
                        resolve();
                    }
                });
            });
        } catch (error) {
            return done(error, undefined);
        }
    }

    if (newEmail != null && newEmail.length != 0) {
        try {
            await new Promise((resolve, reject)=>{
                userServices.emailUpdate(userID, newEmail, (err, data)=>{
                    if (err) {
                        reject(err)
                    }else{
                        currentUserData.email = newEmail
                        resolve()
                    }
                })
            })
        } catch (error) {
            return done(error, undefined)
        }
    }

    if (newYear != null && newYear.length != 0 ) {
        newYear = parseInt(newYear)
        try {
            await new Promise((resolve, reject)=>{
                userServices.yearUpdate(userID, newYear, (err, data)=>{
                    if (err) {
                        reject(err)
                    }else{
                        currentUserData.year =  newYear
                        resolve()
                    }
                })
            })
        } catch (error) {
            return done(error, undefined)
        }
    }

    if (newPass != null && newPass.length != 0 ) {
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
                            // currentUserData.password = newPass
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

    const newJWT = authServices.createJWT(currentUserData)
    return done(undefined, newJWT);
}

module.exports = {findUser, userUpdate}