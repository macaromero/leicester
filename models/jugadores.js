const pool = require("./../utils/bd");
const T_JUGADORES = "jugadores";
const T_FIGURAS = "figuras";

const createJugador = ({nombre}) =>
    pool
        .query("INSERT INTO ?? SET ?", [T_JUGADORES, {nombre}])
        .then ((res) => res)
        .catch ((e) => e);

const createImg = (obj) =>
    pool
        .query("INSERT INTO ?? SET ?", [T_FIGURAS, obj])
        .then ((res) => res)
        .catch ((e) => e);

module.exports = {createJugador, createImg};