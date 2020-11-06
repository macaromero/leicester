const fs = require("fs");
const {v4:uuid} = require("uuid");
const allowExtension = ["png", "jpg", "jpeg"];


const deleteTemp = (file) => fs.unlink(file, e => console.log(e));

const saveFile = ({mimetype, path}, allowE, destFolder = "./images/") => {
  try {
  const [type, extension] = mimetype.split("/");
  if (!allowE.includes(extension)) throw "Formato incorrecto"
  const uid = uuid();
  const fileName = `${uid}`;
  const fileNameOut = `${destFolder}/${uid}.${extension}`;
  fs.createReadStream(path).pipe(fs.createWriteStream(fileNameOut));
  deleteTemp(path); 
  return fileName;  
  } catch (e) {
    deleteTemp (path);
    console.error(e);
  }
};

const imgFile = (file) => saveFile (file, allowExtension);

module.exports = {saveFile, imgFile};