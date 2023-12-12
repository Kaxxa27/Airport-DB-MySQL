require('dotenv').config();

const express = require('express');
const router = require('./router/main-router');

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());

app.use('/api', router);

const start = () => {
    try {
        app.listen(PORT, () => console.log(`Server started on PORT = ${PORT}`))
    } catch (error) {
        console.log(`${error}`)
    }  
};

start();


