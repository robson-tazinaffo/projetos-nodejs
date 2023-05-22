const mysql = require('../mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// exports.cadastrarUsuario =  (req, res, next) => {
//     mysql.getConnection((err, conn) => {
//         if(err){ return res.status(500).send({ error: error }) }
//         conn.query('SELECT * FROM usuarios WHERE email = ?', [req.body.email], (error, results) => {
//             if(error){ return res.status(500).send({ error: error }) }
//             if ( results.length > 0 ) {
//                 res.status(409).send({ mensagem: "Usuário já cadastrado"})
//             } else {
//                 bcrypt.hash( req.body.senha , 10, (errBcrypt, hash) => {
//                     if (errBcrypt) { return res.status(500).send({error: errBcrypt }) }
//                     conn.query(
//                         `INSERT INTO usuarios (email,senha) VALUES (?,?)`, 
//                         [req.body.email, hash],
//                         (error, results) => {
//                             conn.release();
//                             if(error){ return res.status(500).send({ error: error }) }
//                             response = {
//                             mensagem: "Usuário criado com sucesso!",
//                             usuarioCriado: {
//                                 id_usuario: results.insertId,
//                                 email: req.body.email 
//                             }
//                         }
//                         return res.status(201).send(response);
//                     })
//                 })
//             }
//         })
//     });
// };

// exports.login = (req, res, next) => {
//     mysql.getConnection(( error, conn ) => {
//         if(error){ return res.status(500).send({ error: error }) }
//         const query = "SELECT * FROM usuarios WHERE email = ?"
//         conn.query(query, [req.body.email], (error, results, fields) => {
//             conn.release();
//             if(error){ return res.status(500).send({ error: error }) }
//             if (results.length < 1) {
//                 return res.status(401).send({ mensagem: "Falha na autenticação!" })
//             }
//             bcrypt.compare(req.body.senha, results[0].senha, (err, result) => {
//                 if (err) {
//                     return res.status(401).send({ mensagem: "Falha na autenticação!" }); 
//                 }
//                 if (result) {
//                     let token = jwt.sign({
//                         id_usuario: results[0].id_usuario,
//                         email: results[0].email
//                     },
//                     process.env.JWT_KEY,
//                     {
//                         expiresIn: "1H"
//                     });
//                     return res.status(200).send({ 
//                      //    mensagem: "Autenticado com sucesso!",
//                      //    token: token
//                         status: "success",
//                         data: token
//                      });
//                 }
//                 return res.status(401).send({ mensagem: "Falha na autenticação!" }); 
//             })
//         });
//     }) 
//  };

exports.createUser = async (req, res, next) => {

    try {
        // const users = req.body.users.map(user => [
        //     user.email,
        //     bcrypt.hashSync(user.password, 10)
        // ])

        const hash = await bcrypt.hashSync(req.body.password, 10)

        // query = 'INSERT INTO users (email, password) VALUES ?';
        // const results = await mysql.execute(query, [ users ]);
        query = 'INSERT INTO users (email, username, login, password ) VALUES (?,?,?,?)';
        const results = await mysql.execute(query, 
            [ 
                req.body.email, 
                req.body.username, 
                req.body.login, 
                hash 
            ]);

        const response = {
            message: 'Usuário criado com sucesso',
            createdUser: {
                userId: results.insertId,
                email: req.body.email, 
                hash: hash,
                password: req.body.password, 
            }
        }
        return res.status(201).send(response);

    } catch (error) {
        console.log(error);
        return res.status(500).send({ error: error });
    }
};

exports.login = async (req, res, next) => {

    // class=AutenticacaoRestService
    // method=onAutenticaUsuario
    // modulo=mobile

    // Header:
    // Authorization: Basic asdhuii12iuyegy12uguy18932r71b2byh
    
    
    // BODY
    // {
    //     "login":"CAR367",
    //     "password":"Vittia@2018",
    //     "token":"teste",
    //     "versao_so":"teste",
    //     "versao_app":"teste",
    //     "modelo_dispositivo":"teste"
    // }    

    try {

    // class=AutenticacaoRestService
    // method=onAutenticaUsuario
    // modulo=mobile
    const classe = req.query.class;
    const metodo = req.query.method;
    const modulo = req.query.module;
    // Pega a chave de acesso do header
    const JWT_KEY = req.headers.authorization.split(' ')[1];

    // res.json({
    //          classe: `${classe}`,
    //          metodo: `${metodo}`,
    //          modulo: `${modulo}`
    //         });

        const query = `SELECT * FROM users WHERE email = ?`;
        var results = await mysql.execute(query, [req.body.email]);

        if (results.length < 1) {
            // return res.status(401).send({ message: 'Falha na autenticação' })
            return res.status(401).send({
                status: 'error',
                data: "Message not found: Invalid authorization"
            });
        }

        if (JWT_KEY != process.env.JWT_KEY) {
            return res.status(401).send({
                status: 'error',
                data: "Message not found: Invalid authorization"
            });
        }

        if ((classe.length < 1 ) || (metodo.length < 1 ) || (modulo.length < 1 )) {
            return res.status(401).send({
                status: 'error',
                data: "Permissão negada de Classe ou Método"
            });
        }

        if (await bcrypt.compareSync(req.body.password, results[0].password)) {
            const token = jwt.sign({
                token_mobile: results[0].token_mobile,
                user: results[0].user,
                // userid: 802,
                userid: results[0].userId,
                username: results[0].username,
                usermail: results[0].usermail,
                // classe: `${classe}`,
                // metodo: `${metodo}`,
                // modulo: `${modulo}`
                //expiresIn: "5h"
            },
            // process.env.JWT_KEY,
            JWT_KEY,
            {
                expiresIn: "3h"
            }
            );
            return res.status(200).send({
                status: 'success',
                data: token
            });
        }
        // return res.status(401).send({ message: 'Falha na autenticação' })
        return res.status(401).send({
            status: 'error',
            data: "Message not found: Invalid authorization"
        });
    } catch (error) {
        // console.log(error);
        // return res.status(500).send({ message: 'Falha na autenticação' });
        return res.status(500).send({
            status: 'error',
            data: "Message not found: Invalid authorization"
        });
    }
};