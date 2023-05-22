const express = require('express')
const app = express()
const morgan = require('morgan')
const bodyParser = require('body-parser')

const productRoute = require('./routes/product-route')
const peopleRoute = require('./routes/people-route')
const categoryRoute = require('./routes/category-route');
const userRoute = require('./routes/user-route')
const orderRoute = require('./routes/order-route');

// Traz no terminal o response que foi retornado pela API
// Traz (VERBO, ROTA, STATUS CODE, TEMPO DE RESPOSTA, ??)
app.use(morgan('dev'))
app.use('/uploads', express.static('uploads'));
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


app.use('/products', productRoute)
app.use('/peoples', peopleRoute)
app.use('/categories', categoryRoute);
app.use('/orders', orderRoute);
app.use('/users', userRoute)
// app.use('/images', imageRoute);


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