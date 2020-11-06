const express = require("express");
const router = express.Router();
const multer = require("multer");
const config = {dest: "./images/tmp/"};
const upload = multer(config);
const service = require("./../services/jugadores");
//const model = require("./../models/jugadores");

const create = async(req, res) => {
    console.log(req.file, req.body);
    const idFile = await service.createFigura(req.body, req.file);
    res.json(idFile);
}

router.post("/create", upload.single("img"), create);
module.exports = router;