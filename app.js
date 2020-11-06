const express = require("express");
// const morgan = require("morgan");
// const badyParser = require('body-parser');
const bodyParser = require("body-parser");

// EJECUTAR EXPRESS
const app = express();

// CONFIGURAR ARCHIVOS DE RUTAS
var partidos_routes = require("./routes/partidos");
const jugadores_routes = require("./routes/jugadores");
const goles_routes = require("./routes/goles")
// var owner_routes = require("./routes/owner");
// var vete_routes = require("./routes/veterinarios");
// var admin_routes = require("./routes/admin/admin");

// MIDDLEWARES
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// CONFIGURAR CORS
// app.use((req, res, next) => {
//   res.header("Access-Control-Allow-Origin", "*");
//   res.header(
//     "Access-Control-Allow-Headers",
//     "Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method"
//   );
//   res.header("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
//   res.header("Allow", "GET, POST, OPTIONS, PUT, DELETE");
//   next();
// });

// REESCRIBIMOS LAS RUTAS
app.use("/api/partidos", partidos_routes);
app.use("/api/jugadores", jugadores_routes);
app.use("/api/goles", goles_routes);
// app.use("/api/owner", owner_routes);
// app.use("/api/veterinarios", vete_routes);
// app.use("/api/admin", admin_routes);

module.exports = app;
