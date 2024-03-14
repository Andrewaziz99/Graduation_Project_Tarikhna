const express = require('express')
const router = express.Router()
const authController = require('./authController')

router.post('/register', (req,res)=>{
    try {
        const {name, email, password, year} = req.body
        if (!(name, email, password, year)) {
            return res.status(400).send({status: false, data: null,message:"Required inputs are missing"})
        }

        const userDetails=  {
            name, email, password, year
        }
        console.log(userDetails);


        authController.registerUser(userDetails, (err, result)=>{
            if (err) {
                return res.send({status: false, data: null,message: err})
            }else{
                return res.send({status: true, data: result, message: "Registered successfully"})
            }
        })
    } catch (error) {
        return res.send({status: false, data: null ,message:"Unexpected error while registering the user"})
    }
})

router.post("/login", (req, res)=>{
    try {
        const email = req.body.email
        const password = req.body.password
        if (!(email && password)) {
            return res.send({status: false, data: null, message:"Required inputs are missing"})
        }

        authController.loginUser({email, password}, (err, data)=>{
            if (err) {
                res.send({status: false, data: null, message: err})
            }else{
                res.send({status: true, message:"logged in successfully", data})
            }
        })
    } catch (error) {
        res.send({status: false,  data: null, message: "unexpected error try after sometime"})
        
    }
})

module.exports = router
