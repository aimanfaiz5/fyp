const express = require('express');
const app = express();
const dotenv = require('dotenv');
const { response } = require('express');

const location = {"name": "Admin", "status": "12"};
const locations = [{"name": "Admin", "status": "12" }, {"name": "MM", "status": "00"}, {"name": "STC", "status": "05"}];

app.get('/location', (req, res) => {
    res.status(200).send(location);
});

app.get('/locations', (req, res) => {
    res.status(200).send(locations);
});

app.use((req, res, next) => {
    res.status(404).send("Sorry, that route doesn't exist.");
});
    dotenv.config({
        path: './config/config.env'
    } );
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);

});