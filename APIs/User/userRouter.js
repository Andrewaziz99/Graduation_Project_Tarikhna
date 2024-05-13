const express = require('express')
const router = express.Router()
const userServices = require('./userServices')
const userController = require('./userController')

router.get('/', (req, res)=>{
    const userData = req.claims
    if(!userData.email){
        return res.status(200).send({status: false, message:"The email is not found", data: null})
    }
    try {
        userController.findUser(false, userData.email, (err, result)=>{
            if (err) {
                return res.status(200).send({status: false, message: err, data: null})
            }
            // console.log(result);
            
            if (!result) {
                return res.status(200).send({status: false, message: "This user is not found", data: null})
            }
            
            return res.status(200).send({status: true, message: "Data retrieved successfully", data: result})

        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }

})

router.put('/update', (req, res) => {
    const currentUserData = {
        id: req.claims.id,
        name: req.claims.name,
        email: req.claims.email,
        // password: req.claims.password,
        year: req.claims.year
    }
    try {
        userController.userUpdate(currentUserData, req.claims.id, req.body.newName, req.body.newEmail, req.body.oldPass, req.body.newPass, req.body.newYear, (err, data) => {
            if (err) {
                return res.send({ status: false, message: err, data: null })
            }
            req.claims.name = data.name
            req.claims.email = data.email
            req.claims.password = data.password
            req.claims.year = data.year
            return res.send({ status: true, message: "Data updated successfully", data: data })

        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })

    }


})

module.exports = router