const express = require('express')
const router = express.Router();
const login = require("../middleware/login");

const PeoplesController = require('../controllers/people_controller');

const multer = require('multer');

router.get(
    '/', 
    login.required, 
    PeoplesController.getPeoples
    );

// router.post(
//     '/', 
//     login.required, 
//     PeoplesController.postPeople
// );

// router.get('/:peopleId', PeoplesController.getPeopleDetail);
// router.patch('/:peopleId', login.required, PeoplesController.updatePeople);
// router.delete('/:peopleId', login.required, PeoplesController.deletePeople);

module.exports = router;