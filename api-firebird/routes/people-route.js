const express = require('express');
const router = express.Router();
// const login = require('../middleware/login');

const PeoplesController = require('../controllers/people-controller');

router.get('/', PeoplesController.getPeoples);
router.get('/:id', PeoplesController.getPeoplesDetail);
router.delete('/:id', PeoplesController.deletePeople);
// router.post('/', login.required, PeoplesController.postPeople);


module.exports = router;