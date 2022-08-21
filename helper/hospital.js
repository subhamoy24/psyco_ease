
module.exports = (data) => {
  let response = {}
  let arr = data.Psychiatrists;
  response['name'] = data.name
  response['totalPsychiatrists'] = arr.length
  
  response['totalPatients']
  let patients = arr.map((a) => {
    return {
      id: a.id,
      name: a.name,
      patientsCount: a.Patients.length
    }
  })
  const l = patients.reduce((previousValue, currentValue) => previousValue + currentValue.patientsCount, 0);
  response['totalPatients'] = l;
  response['patientDetails'] = patients;
  return response;
}