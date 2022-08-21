'use strict';
const express = require("express");
const { Sequelize } = require("../models");
const router = express.Router();
const db = require('../models');
const formattedData = require('../helper/hospital')

router.get('/get', async (req, res) => {
  const id = req.query.id;
  console.log(id);
  const hospital = await db.Hospital.findOne({where: {id: id}, include: { model: db.Psychiatrist, include: { model: db.Patient }}})
  if(!hospital) {
    return res.status(404).json({success: 0, message: "hospital not found"})
  } else {
    const a = formattedData(hospital)
    return res.status(200).json({success: 1, hospital: a})
  }
})

module.exports = router;