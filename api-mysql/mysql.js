require('dotenv').config()
const mysql = require('mysql')

var pool = mysql.createPool({
    "connectionLimit": 1000,
    "user" : "root",
    "password" : "Ekt]+c@AQv>ej(FE",
    "database" : "ecommerce",
    "host" : "localhost",
    "port" : 3306,

    // connectionLimit: 1000,
    // user: process.env.DB_USER,
    // password: process.env.DB_PASSWORD,
    // database: process.env.DB_NAME,
    // host: process.env.DB_HOST,
    // port : process.env.DB_PORT,
  
});

exports.execute = (query, params=[]) => {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (error, result, fields) => {
            if (error) {
                reject(error);
            } else {
                resolve(result)
            }
        });
    })
}

exports.pool = pool;
