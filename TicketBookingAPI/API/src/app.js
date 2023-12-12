require('dotenv').config();

const express = require('express');

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());

const start = () => {
    try {
        app.listen(PORT, () => console.log(`Server started on PORT = ${PORT}`))
    } catch (error) {
        console.log(`${error}`)
    }  
};

start();


