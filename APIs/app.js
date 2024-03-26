const express = require('express')
const app = express()
const config = require('./config')
const AIrouter = require('./AI_Summerization')
const userRouter = require('./User')
const authMiddleware = require('./authentication/authMiddleware')
const authRouter = require('./authentication')
const lessonRouter =  require('./lesson/lessonRouter')
const quizRouter = require('./quiz/quizRouter')
const connectDb = require('./dbConnection')
connectDb()


app.use(express.json())
app.use('/AI_Summary', AIrouter)
app.use('/auth', authRouter)
app.use('/user', authMiddleware ,userRouter)
app.use('/lesson',authMiddleware, lessonRouter)
app.use('/quiz',authMiddleware ,quizRouter)




app.use((req, res, next)=>{
    res.status(400).send("Resource not found")
})


app.listen(config.PORT, ()=>{
    console.log(`Listening on port ${config.PORT}`);
})