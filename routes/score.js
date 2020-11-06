const express = require("express");
const router = express.Router();
// const partidosController = require("./../controllers/partidos");
const model = require("./../models/partidos");

const test = (req, res) => {
  const test = model.get();
  res.json(test);
};

router.get("/test", test);
router.get("/last"); //ultimo partido
router.get("/all"); //todos los partidos
router.get("/:id"); //partido particular
// router.get("/date"); //por fecha
router.post("/newgame");
router.get("/score");

module.exports = router;

// get partidos/all

// get partidos/:id

// get partidos/
