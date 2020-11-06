"use strict";

// const db = require("./../models").owner;
const { get } = require("./../models/partidos");

const controller = {
  test: (req, res) => {
    get()
  },
};

module.exports = controller;
