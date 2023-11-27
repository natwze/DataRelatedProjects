const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const mustacheExpress = require('mustache-express');

const app = express();
const port = 3000;

app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', './templates');
app.use(bodyParser.urlencoded({ extended: true }));

var dbcon = mysql.createConnection({
    host: 'localhost',
    user: 'nathanael',
    password: 'pokedb',
    database: 'poke_info'
})

function templateRenderer(template, res) {
    return function (error, results, fields) {
        if (error)
            throw error;
        
        res.render(template, { data: results });
    }
}

app.get('/', function (req, res) {
    dbcon.connect();
    dbcon.query("SELECT * FROM pokemon;", templateRenderer('index', res));
    dbcon.end();
})

app.listen(port, function () {
    console.log('The app is listening at http://localhost:' + port + '.'); 
})
