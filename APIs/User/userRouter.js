const express = require('express')
const router = express.Router()
const userServices = require('./userServices')
const userController = require('./userController')

router.get('/', (req, res)=>{
    const userData = req.claims
    if(!userData.email){
        return res.status(400).send("The email is not found")
    }
    try {
        userController.findUser(userData.email, (err, result)=>{
            if (err) {
                return res.status(400).send(err)
            }
            console.log(result);
            if (!result) {
                return res.status(404).send("This user is not found")
            }
            return res.status(200).send(result)

        })
    } catch (error) {
        return res.status(500).send("Unexpected error has occured please try again after sometime")
    }

})

module.exports = router