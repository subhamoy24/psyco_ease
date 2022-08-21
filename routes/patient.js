'use strict';
const express = require("express");
const router = express.Router();
const _ = require('lodash');
const bcrypt = require('bcrypt');
const multer = require('multer');
const registerValidator = require('../validator')
const db = require('../models');

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
     cb(null, 'public/uploads');
  },
  filename: function (req, file, cb) {
     cb(null, Date.now() + '-' + file.originalname);
  }
});
var upload = multer({ storage: storage });
   
/**
 * Create New Item
 *
 * @return response()
 */

router.post('/', upload.single('photo'), async (req, res) => {
  const allowedKeys = ['name', 'email', 'password', 'address', 'phoneNumber', 'psychiatristId']
  const patient = _.pick(req.body, allowedKeys)
  req.file ? patient['photo'] = req.file.filename : ''

  const { valid, errors } = registerValidator(patient)
  if(!valid) {
    return res.status(400).json({ success: 0, messages: errors.map((err) => { return err.message; }) })
  }

  const passwordHash = bcrypt.hashSync(patient.password, 10);
  patient.password = passwordHash;

  const uniqueEmail = await db.Patient.findOne({
    where: { email: patient.email},
    attributes: ['id']
  });

  if(uniqueEmail) {
    return res.status(400).json({ success: 0, messages: ["Email has already been taken"] })
  }

  const psychiatrist = await db.Psychiatrist.findOne({
    where: {id: patient.psychiatristId },
    attributes: ['id']
  })

  if(!psychiatrist) {
    return res.status(400).json({success: 0, messages: ["Psychiatrist does not exist"]});
  }

  try {
    const created = await db.Patient.create(patient);

    if(created) {
      return res.status(200).json({success: 1, messages: ["Successfully Patient created"]});
    }else {
      return res.status(200).json({ success: 0, messages: ["Sorry, Patient has not been created"]})
    }
  }catch(e) {
    return res.status(500).json({success: 0, messages: ["some internal error has been occured"]})
  } 
})

module.exports = router;