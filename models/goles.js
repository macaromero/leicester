const pool = require("./../utils/bd");
const T_PARTIDOS = "partidos";
const T_EQUIPOS = "equipos";


const get = () =>
  pool
    .query("SELECT partidos.golVisitante as cantidadGoles, partidos.idEquipo, equipos.nombre FROM ?? JOIN ?? ON partidos.idEquipo = equipos.id WHERE partidos.golVisitante = (SELECT MAX(partidos.golVisitante) FROM ??)", [T_PARTIDOS, T_EQUIPOS, T_PARTIDOS])
    .then((result) => result)
    .catch((e) => e);


module.exports = { get };
