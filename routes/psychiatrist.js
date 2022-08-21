'use strict';
const express = require("express");
const router = express.Router();
const _ = require('lodash');
const multer = require('multer');
const bcrypt = require('bcrypt');
const registerValidator = require('../validator/psychiatrist')
const db = require('../models');
/**
 * Create New Item
 *
 * @return response()
 */
const upload = multer() 
router.post('/', upload.single('photo'), async (req, res) => {
  const allowedKeys = ['name', 'email', 'password', 'hospitalId'];
  const psychiatrist = _.pick(req.body, allowedKeys);
  const { valid, errors } = registerValidator(psychiatrist);

  if(!valid) {
    return res.status(400).json({ success: 0, messages: errors.map((err) => { return err.message; }) })
  }

  const passwordHash = bcrypt.hashSync(psychiatrist.password, 10);
  psychiatrist.password = passwordHash;

  const uniqueEmail = await db.Psychiatrist.findOne({
    where: { email: psychiatrist.email},
    attributes: ['id']
  });

  if(uniqueEmail) {
    return res.status(400).json({ success: 0, messages: ["Email has already been taken"] })
  }

  const hospitalExist = await db.Hospital.findOne({
    where: { id: psychiatrist.hospitalId},
    attributes: ['id']
  });

  if(!hospitalExist){
    return res.status(400).json({ success: 0, messages: ["Hospital does not Exist"] })
  }

  try {
    const created = await db.Psychiatrist.create(psychiatrist);

    if(created) {
      return res.status(200).json({success: 1, messages: ["Successfully Psychiatrist created"]});
    }else {
      return res.status(400).json({ success: 0, messages: ["Sorry, Psychiatrist has not been created"]})
    }
  }catch(e) {
    console.log(e)
    return res.status(500).json({success: 0, messages: ["some internal error has been occured"]})
  } 
})

module.exports = router;