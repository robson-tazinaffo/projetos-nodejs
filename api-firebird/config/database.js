require('dotenv').config();
const firebird = require('node-firebird');

var options = {};

options.host = 'localhost';
options.port = 3050;
options.database = 'C://api_firebird//db//dados.fdb';
options.user = 'SYSDBA';
options.password = 'masterkey';
options.lowercase_keys = false; // set to true to lowercase keys
options.role = null;            // default
options.pageSize = 4096;        // default when creating database
options.retryConnectionInterval = 1000; // reconnect interval in case of connection drop

var pool = firebird.pool(3000, options);

const people = firebird.attach(options, (err, db) => {
    
    if (err) {
       //throw err;
       console.log(err);
    }
    else{
        db.query('SELECT ID FROM PEOPLES WHERE ID = 1', function(err,result){
            try{
                // this.peoples = result;
                console .log('conectado com sucesso!');
                // console.log(result);
                db.detach();
            }catch{
                throw err;
            }
        });
    }

    return this.peoples;
});

module.exports = people;

