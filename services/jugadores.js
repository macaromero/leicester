const model = require("./../models/jugadores");
const fileHandler = require("./../utils/fileHandler");

const createFigura = async(body, file) => {
    try {
        const {insertId : idJugador} = await model.createJugador(body);
        const uid = fileHandler.imgFile(file);
        const obj = {idJugador,uid};
        const {insertId : idFile} = await model.createImg(obj);
    return idFile;    
    } catch (error) {
        console.log(error);
    }
};

module.exports = {createFigura};