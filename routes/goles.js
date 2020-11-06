const express = require("express");
const router = express.Router();
// const partidosController = require("./../controllers/partidos");
const model = require("./../models/goles");

const goles = async(req, res) => {
    try {
        const [mayoria] = await model.get();
        res.json(mayoria);
    } catch (error) {
        console.log(error)
    }

};


router.get("/", goles);

module.exports = router;