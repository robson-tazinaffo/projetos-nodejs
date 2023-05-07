const express = require('express');
const res = require("express/lib/response");
// const db = require('./config/conn');
const firebird = require('node-firebird');
const utf8 = require('utf8');

let options = {};
const path_DB= 'C://api_firebird//db//dados.fdb';
options.host = 'localhost';
options.port = 3050;
options.database = path_DB;
options.user = 'SYSDBA';
options.password = 'masterkey';
options.lowercase_keys = false;
options.role = null;
options.pageSize = 4096;
options.retryConnectionInterval = 1000; // reconnect interval in case of connection drop


exports.getPeoples = async (req, res, next) => {
    let ssql = "SELECT ID, NAME, EMAIL FROM PEOPLES";

    try {

        firebird.attach(options, (err, db) => {
            if (err) {
                console.log(err);
                return res.status(500).json(err);
            } else {
                db.query(ssql, function(err, result) {
                    if (result != undefined) { 
                        for (i=0; i < result.length ; i++){
                            // console.log("ID: " , result[i].ID.toString(), "  Nome: " , result[i].NAME.toString('latin1'), " ", "Email: ", result[i].EMAIL.toString('latin1'));

                            res.status(200).json({ 
                                name: result[i].NAME.toString('utf8'), 
                                email: result[i].EMAIL.toString('utf8'), 
                            }); 
                        }                
                    } else {
                        console.log("No results");
                        db.detach();
                    }
                });    
            }
          })
    } catch (err) {
        console.log(err);
        return res.status(500).send(err);
    }
};

exports.getPeoplesDetail = async (req, res, next) => {
    let ssql = "SELECT ID, NAME, EMAIL FROM PEOPLES WHERE ID = ?";

    try {

        firebird.attach(options, (err, db) => {
            if (err) {
                return res.status(500).json(err);
            } else {
                db.query(ssql, [req.params.id], function(err, result) {
                    if (result != undefined) { 
                        for (i=0; i < result.length ; i++){
                            // console.log("ID: " , result[i].ID.toString(), "  Nome: " , result[i].NAME.toString('latin1'), " ", "Email: ", result[i].EMAIL.toString('latin1'));

                            res.status(200).json({ 
                                name: result[i].NAME.toString('latin1'), 
                                email: result[i].EMAIL.toString('latin1'), 
                            }); 


                        }                
                    } else {
                        console.log("No results");
                        db.detach();
                    }
                });                

            }
          })


    } catch (err) {
        console.log("Erro: " + err);
        return res.status(500).send(err);
    }
};


exports.deletePeople = async (req, res) => {
    let ssqlp = "SELECT * FROM PEOPLES WHERE id = ?";
    let ssqld = "DELETE FROM PEOPLES WHERE id = ?";
    try {
        firebird.attach(options, (err, db) => {
            if (err) {
                return res.status(500).json(err);
            } else {
                db.query(ssqlp, [req.params.id], function(err, result) {
                    if (result.length > 0) {
                        db.query(ssqld, [req.params.id], function(err, result) {
                            if (err) {
                                return res.status(500).json(err);
                            } else {
                                return res.status(200).json("Cliente deletado com sucesso!");
                            }
                        });   
                        return res.status(200).json("Cliente deletado com sucesso!");
                    } else {
                        return res.status(405).json("Cliente não encontrado!");
                    }
                });   
                db.detach();
            }
      })
    } catch (err) {
        return res.status(500).send(err);
    }
};
