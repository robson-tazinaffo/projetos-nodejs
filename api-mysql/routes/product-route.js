const express = require('express')
const router = express.Router();
const login = require("../middleware/login");

const ProductsController = require('../controllers/product-controller');

const multer = require('multer');
const moment = require("moment");

var maxSize = 1 * 1000 * 1000;
let datahora = moment().format("DDMMYYYY-hhmmss");

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './uploads/');
    },
    filename: function(req, file, cb) {
        cb(null, datahora + '-' + file.originalname);
}
});

const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
        cb(null, true);
    } else {
        cb(null, false);
    }
}

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 5
    },
    fileFilter: fileFilter
});

router.get('/', ProductsController.getProducts);
router.get('/category', ProductsController.getProductsCategory);

router.post(
    '/', 
    login.required, 
    upload.single('image'), 
    ProductsController.postProduct
);

router.get('/:productId', ProductsController.getProductDetail);
router.patch('/:productId', login.required, ProductsController.updateProduct);
router.delete('/:productId', login.required, ProductsController.deleteProduct);

// imagens
router.post(
    '/:productId/image',
    login.required,
    upload.single('image'),
    ProductsController.postImage
)
router.get(
    '/:productId/images',
    ProductsController.getImages
)


module.exports = router;