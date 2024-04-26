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
        userController.findUser(userData.email, (err, result)=>{
            if (err) {
                return res.status(200).send({status: false, message: err, data: null})
            }
            console.log(result);
            if (!result) {
                return res.status(200).send({status: false, message: "This user is not found", data: null})
            }
            return res.status(200).send({status: true, message: "Data retrieved successfully", data: result})

        })
    } catch (error) {
        return res.send({ status: false, message: "Error has occured, please try again after some time", data: null })
    }

})

module.exports = router