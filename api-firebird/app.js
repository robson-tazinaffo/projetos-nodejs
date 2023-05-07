// const express = require("express");
// const cors = require("cors");
// const db = require("./config/conn");
// const res = require("express/lib/response");
// const morgan = require('morgan')

// const app = express();

// // Middleware JSON
// app.use(express.json());
// // Middleware CORS
// app.use(cors());


// app.use(morgan('dev'))


// /*
//     Verbos HTTP:
//     --------------------------
//     GET -> Retornar dados
//     POST -> Cadastrar dados
//     PUT -> Editar dados
//     PATCH -> Editar dados
//     DELETE -> Excluir dados
// */

// /*
// 	Status Code:
//     --------------------------
//     200 -> Retornar OK
// 	201 -> Inserido com sucesso
// 	400 -> Erro (cliente)
// 	401 -> Não autorizado
// 	404 -> Não encontrado
// 	500 -> Erro (servidor)
// */

// let options = {};
// const path_DB= 'D://cursos//node//firebird//db//dados.fdb';
// options.host = 'localhost';
// options.port = 3050;
// options.database = path_DB;
// options.user = 'SYSDBA';
// options.password = 'masterkey';
// options.lowercase_keys = false;
// options.role = null;
// options.pageSize = 4096;
// options.retryConnectionInterval = 1000; // reconnect interval in case of connection drop


// // Rotas
// app.get("/peoples", async function(request, response){

//     // let ssql = "SELECT * FROM PEOPLES WHERE ID = ?";
//     const ssql = "SELECT * FROM PEOPLES";

//     try {
//         const db = await req.firebird.openDataBaseRead(options);        
//         // const result = await db.query(ssql, [req.query.id]);
//         const result = await db.query(ssql);
//         return response.status(200).json(result);
//     } catch (err) {
//         return response.status(500).send(err);
//     }
// });

// app.listen(3000, function() {
//     console.log("Servidor executando na porta 3000");
// });

const express = require('express')
const app = express()
const morgan = require('morgan')
const bodyParser = require('body-parser')

const peopleRoute = require('./routes/people-route')

// Traz no terminal o response que foi retornado pela API
// Traz (VERBO, ROTA, STATUS CODE, TEMPO DE RESPOSTA, ??)
app.use(morgan('dev'))
app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header(
        'Access-Control-Allow-Header',
        'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    );

    if (req.method === 'OPTIONS') {
        res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
        return res.status(200).send({});
    }
    next();
});


app.use('/peoples', peopleRoute)


// Se não emcontrar a rota passada
app.use((req, res, next) => {
    const erro = new Error('Rota não encontrada!')
    erro.status = 404
    next(erro)
})

app.use((error, eq, res, next) => {
    res.status(error.status || 500)
    return res.send({
        erro: { 
            mensagem: error.message
        }
    })

})


module.exports = app


