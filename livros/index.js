const express = require('express')
const path = require('path')
const sqlite3 = require('sqlite3').verbose()

// Criação do serviço Express
const app = express()

// Configuração do serviço
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))
app.use(express.static(path.join(__dirname, 'public')))
app.use(express.urlencoded({ extended: false }))

// Connexão com a base SQlite
const db_name = path.join(__dirname, 'data', 'livros.db')
const db = new sqlite3.Database(db_name, err => {
    if (err) {
        return console.error(err.message)
    }
    console.log(
        "Conexão estabelecida com sucesso com o banco de dados  'livros.db'"
    )
})

// Criação da tabela livros (Livro_ID, Titulo, Autor, Comentarios)
const sql_create = `CREATE TABLE IF NOT EXISTS Livros (
  Livro_id INTEGER PRIMARY KEY AUTOINCREMENT,
  Titulo VARCHAR(100) NOT NULL,
  Autor VARCHAR(100) NOT NULL,
  Comentarios TEXT
);`
db.run(sql_create, err => {
    if (err) {
        return console.error(err.message)
    }
    console.log('Criação da tabela livros bem sucedida!')
    // Inserindo dados na tabela
    const sql_insert = `INSERT INTO Livros (Livro_ID, Titulo, Autor, Comentarios) VALUES
  (1, 'Firebird Essencial', 'Carlos H. Cantu', 'Editora Ciência Moderna'),
  (2, 'A Startup Enxuta', 'Eric Ries', 'Editora LeYa'),
  (3, 'Segurança em Redes', 'Alexandre Fernandes de Moraes', 'Editora Érica'),
  (4, 'SCRUM', 'JEFF SUTHERLAND e J.J. SUTHERLAN', 'Editora Sextante');`
    db.run(sql_insert, err => {
        if (err) {
            // Exibindo erro caso aconteça algo durante a inserção na tabela
            // return console.error(err.message)
        }
        console.log('Tabela de livros preenchida com sucesso!')
    })
})

// Escutando n aporta
app.listen(3000, () => {
    console.log('Servidor executando em (http://localhost:3000/) !')
})

// GET /
app.get('/', (req, res) => {
    res.render('index')
})

// GET /about
app.get('/about', (req, res) => {
    res.render('about')
})

// GET /data
app.get('/data', (req, res) => {
    const test = {
        titulo: 'Test',
        items: [
            'Firebird Essencial',
            'A Startup Enxuta',
            'Segurança em Redes',
            'SCRUM'
        ]
    }
    res.render('data', { model: test })
})

// GET /livros
app.get('/livros', (req, res) => {
    const sql = 'SELECT * FROM livros ORDER BY Titulo'
    db.all(sql, [], (err, rows) => {
        if (err) {
            return console.error(err.message)
        }
        res.render('Livros', { model: rows })
    })
})

// GET /create
app.get('/create', (req, res) => {
    res.render('create', { model: {} })
})

// POST /create
app.post('/create', (req, res) => {
    const sql =
        'INSERT INTO Livros (Titulo, Autor, Comentarios) VALUES (?, ?, ?)'
    const book = [req.body.Titulo, req.body.Autor, req.body.Comentarios]
    db.run(sql, book, err => {
        if (err) {
            return console.error(err.message)
        }
        res.redirect('/livros')
    })
})

// GET /edit/5
app.get('/edit/:id', (req, res) => {
    const id = req.params.id
    const sql = 'SELECT * FROM Livros WHERE Livre_ID = ?'
    db.get(sql, id, (err, row) => {
        if (err) {
            return console.error(err.message)
        }
        res.render('edit', { model: row })
    })
})

// POST /edit/5
app.post('/edit/:id', (req, res) => {
    const id = req.params.id
    const book = [req.body.Titulo, req.body.Autor, req.body.Comentarios, id]
    const sql =
        'UPDATE livros SET Titulo = ?, Autor = ?, Comentarios = ? WHERE (Livre_ID = ?)'
    db.run(sql, book, err => {
        if (err) {
            return console.error(err.message)
        }
        res.redirect('/livros')
    })
})

// GET /delete/5
app.get('/delete/:id', (req, res) => {
    const id = req.params.id
    const sql = 'SELECT * FROM livros WHERE Livre_ID = ?'
    db.get(sql, id, (err, row) => {
        if (err) {
            return console.error(err.message)
        }
        res.render('delete', { model: row })
    })
})

// POST /delete/5
app.post('/delete/:id', (req, res) => {
    const id = req.params.id
    const sql = 'DELETE FROM livros WHERE Livre_ID = ?'
    db.run(sql, id, err => {
        if (err) {
            return console.error(err.message)
        }
        res.redirect('/livros')
    })
})
