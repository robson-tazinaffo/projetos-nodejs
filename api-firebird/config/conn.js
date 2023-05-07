const firebird = require('node-firebird');

var options = {};

const path_DB= 'C://api_firebird//db//dados.fdb';
options.host = 'localhost';
options.port = 3050;
options.database = path_DB;
options.user = 'SYSDBA';
options.password = 'masterkey';
options.lowercase_keys = false; // set to true to lowercase keys
options.role = null;            // default
options.pageSize = 4096;        // default when creating database
options.retryConnectionInterval = 1000; // reconnect interval in case of connection drop

const conn = firebird.attach(options, function(err, db) {
    if (err) {
        throw err;
    } else {
        if (err) {
            console.log("Erro ao conectar com o banco:", err.message);
        } else {
            console.log("Conexão realizada com sucesso!");
        }
        db.detach();
    }
});

module.exports = conn;