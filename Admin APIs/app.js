const express = require('express')
const app = express()
const cors = require('cors')
const config = require('./config')
// const AIrouter = require('./AI_Summerization')
// const userRouter = require('./User')
// const authMiddleware = require('./authentication/authMiddleware')
// const authRouter = require('./authentication')
const lessonRouter =  require('./lesson/lessonRouter')
const fileUpload = require("express-fileupload");
const quesRouter = require('./questions/quesRouter')

const connectDb = require('./dbConnection')
connectDb()


app.use(express.json())
app.use(cors({
    origin: "http://localhost:3000",
    methods: ["GET", "POST", "PUT", "DELETE"]
}))
// app.use(fileUpload())

// app.use('/AI_Summary', AIrouter)
// app.use('/auth', authRouter)
// app.use('/user', authMiddleware ,userRouter)
app.use('/lesson',lessonRouter)
app.use('/questions', quesRouter)




app.use((req, res, next)=>{
    res.status(400).send("Resource not found")
})


app.listen(config.PORT, ()=>{
    console.log(`Listening on port ${config.PORT}`);
})