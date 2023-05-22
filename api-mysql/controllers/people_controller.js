const mysql = require('../mysql');

exports.getPeoples = async (req, res, next) => {
    try {
    
        const query = `
            SELECT *
               FROM peoples;
        `;
        const result = await mysql.execute(query)
        const response = {
            status: "success",
            data: result.map(peop => {
                return {
                    codigo: peop.codigo,
                    name_emit: peop.nome_emit,
                    premiacao: peop.premiacao,
                    cgc: peop.cgc,
                    cidade: peop.cidade,
                    tipo: peop.tipo,
                    ins_estadual: peop.ins_estadual,
                    bairro: peop.bairro,
                    cep: peop.cep,
                    email: peop.email,
                    nome_contato: peop.nome_contato,
                    email_fatur: peop.email_fatur,        
                    telefone: peop.telefone,
                    cod_gr_cli: peop.cod_gr_cli,
                    nome_abrev: peop.nome_abrev,
                    nome_matriz: peop.noem_matriz,
                    cod_rep: peop.cod_rep,
                    estado: peop.estado,
                    pais: peop.pais,
                    endereco: peop.endereco,
                    tipo_relacionamento: peop.tipo_relacionamento,
                    dt_atualiza_wms: peop.dt_atualiza_wms,
                    representante: peop.representante,
                    coordenador: peop.coordenador
                }
            })
        }
        return res.status(200).send(response);
    } catch (error) {
        return res.status(500).send({ error: error });
    }
};

