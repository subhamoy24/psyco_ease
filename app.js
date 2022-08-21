const express = require('express');
const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }));

const patientRoute = require('./routes/patient');
const psychiatristRoute = require('./routes/psychiatrist');
const hospitalRoute = require('./routes/hospital');

// Add headers in order to perform all operation on API
// Because CORS Thing (Google it if you do not know)
app.use((req, res, next) =>{
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Header", "*");
  
  next();
});

app.use("/patient", patientRoute);
app.use("/psychiatrist", psychiatristRoute);
app.use('/hospitals', hospitalRoute);

app.listen(8888);


