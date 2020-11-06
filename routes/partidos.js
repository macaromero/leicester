const express = require("express");
const router = express.Router();
// const partidosController = require("./../controllers/partidos");
const model = require("./../models/partidos");

const test = (req, res) => {
  const test = model.get();
  res.json(test);
};

const all = async (req, res) => {
  // console.log(req.query);
  const { fecha_desde, fecha_hasta } = req.query;
  console.log(req.query);
  if (fecha_desde && fecha_hasta) {
    const date = `fecha >= '${fecha_desde}' AND fecha <= '${fecha_hasta}'`;
    console.log(date);
    const partidos = await model.get(date);
    res.json(partidos);
  } else {
    const partidos = await model.get();
    res.json(partidos);
  }
};

const unique = async (req, res) => {
  const { id } = req.params;
  const [partidoUnico] = await model.single(id);
  res.json(partidoUnico);
};

const create = async(req, res) => {
  const nuevoPartido = await model.createPartido(req.body);
  res.json(nuevoPartido)
};

router.get("/test", test);
router.get("/last"); //ultimo partido
router.get("/all", all); //todos los partidos      listo    listo por fecha!
router.get("/:id", unique); //partido particular
// router.get("/date"); //por fecha
router.post("/newgame", create);
router.get("/score");

module.exports = router;

// get partidos/all

// get partidos/:id

// get partidos/

