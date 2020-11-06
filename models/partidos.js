const pool = require("./../utils/bd");
const T_PARTIDOS = "partidos";

// const get = () => {
//   const saludo = {
//     hola: "Hola",
//   };

//   return saludo;
// };

const get = (conditions = true) =>
  pool
    .query("SELECT * FROM ?? WHERE ? ", [T_PARTIDOS, conditions])
    .then((result) => result)
    .catch((e) => e);

const single = (id) =>
  pool
    .query("SELECT * FROM ?? WHERE id = ?", [T_PARTIDOS, id])
    .then((res) => res)
    .catch((e) => e);
// const getByDate = (condition) =>
//   pool
//     .query("SELECT * FROM ?? WHERE fecha = ?", [T_PARTIDOS, condition])
//     .then((result) => result)
//     .catch((e) => e);

const createPartido = (obj) => 
  pool
    .query("INSERT INTO ?? SET ?", [T_PARTIDOS, obj])
    .then ((res) => res)
    .catch ((e) => e);


module.exports = { get, single, createPartido };
