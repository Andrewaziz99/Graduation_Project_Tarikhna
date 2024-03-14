const jwt = require('jsonwebtoken')
const config = require('../config')

const vrifyToken = (req,res, next)=>{
    const token = req.headers["authorization"]

    if (!token) {
        return res.status(403).send("A token is required for authentication")
    }

    try {
        const decoded= jwt.verify(token, 'secret')
        // console.log(decoded);
        req.claims = decoded
        // console.log(req.claims);
    } catch (error) {
        return res.status(401).send("invalid token")
        
    }
    return next()
}

module.exports = vrifyToken