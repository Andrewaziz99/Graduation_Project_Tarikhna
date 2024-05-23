require('dotenv').config()

const config = {
    PORT: process.env.PORT || 3000,
    AUTH_SECRET: process.env.AUTH_SECRET,
    CONNECTION_STRING: process.env.CONNECTION_STRING,
    API_KEY: process.env.API_KEY
}

module.exports = config 