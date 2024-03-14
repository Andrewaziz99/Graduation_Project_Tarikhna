const express = require('express')
const router = express.Router()
const AI_Controller = require('./AI_Controller')
const AI_DAO = require('./AI_DAO')

router.post('/', (req,res)=>{
    // console.log(req.body.data);
    try {
        if (!req.body.data) {
            res.status(400).send("Data must be entered")
        }else{
            const historicalText = JSON.stringify(req.body.data)
            AI_Controller.summarizeText(historicalText, (err, result)=>{
                if (err) {
                    return res.status(400).send(err)
                }
                return res.status(200).send(result)
            })
        }
    } catch (error) {
        console.log("hey");
        res.status(500).status("Error has occured, please try again after some time", error)
        
    }
})

router.get("/summarizedItems", (req,res)=>{
    try {
        AI_Controller.getAllSavedItems((error, result)=>{
            if (error) {
                return res.status(400).send({message: error, data: null})
            }else{
                if (result.length !== 0) {
                    return res.status(200).send({message: "Saved items retrieved successfully", data: result})
                }else{
                    return res.status(404).send({message: "No saved items found", data: null})
                }
            }
        })
        
    } catch (error) {
        return res.status(500).send({message: `Unexpected error, try after sometime , ${error}`, data: null})
        
    }
})

router.post('/saveSummarizedItem', (req, res)=>{
    if (!req.body.Title) {
        console.log(req.body);
        return res.status(400).send({message: "inputs are required", data: null})
    }
    try {
        // const data = 
        AI_Controller.saveSummarizedItem(req.body, (error, result)=>{
            if (error) {
                return res.status(400).send({message: error, data: null})
            }else{
                return res.status(200).send({message: "Saved successfully", data: req.body})
            }
        })
        
    } catch (error) {
        return res.status(500).send({message: `Unexpected error, try after sometime , ${error}`, data: null})
    }
})
module.exports = router