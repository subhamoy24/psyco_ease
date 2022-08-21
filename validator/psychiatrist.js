//const db = require('./models');
const Ajv = require('ajv');
const addFormats = require('ajv-formats');
const addErrors = require('ajv-errors');

const ajv = new Ajv({ strict: false, allErrors: true });
addFormats(ajv);
addErrors(ajv);
/*ajv.addKeyword('validatePsychiatrist', {
  schema: false,
  validate: function op(data, dataPath, parentData, parentDataProperty) {
    return db.Psychiatrist.findOne({
      where: { id: data }
    }).then((res) => {
      if(res) {
        return true;
      }else{
        op.errors = [];
        op.errors.push({
          keyword: "validateMaxPoints",
          message:   'psychiatrist not found with the id given',
          params: {
            keyword: "validateMaxPoints"
          }
        });
        return false;
      }
    }).catch((err) => {
      op.errors = [];
      op.errors.push({
        keyword: "validateMaxPoints",
        message:   'psychiatrist not found with the id given',
        params: {
          keyword: "validateMaxPoints"
        }
      });
      return false
    })
  }
})*/

/*ajv.addKeyword( {
  keyword: "uniqueEmail",
  async: true,
  schema: false,
  validate: async function op(schema, data) {
    console.log(data)
    const res = await db.Patient.findOne({
      where: { email: data},
      attributes: ['id']
    })
    return !!res
  }
})*/
ajv.addKeyword('isNotEmpty', {
  type: 'string',
  validate: function(schema, data) {
    return data.trim() !== '';
  },
  errors: false
})

const schema = {
  type: 'object',
  properties: {
    name: {
      type: 'string',
      isNotEmpty: true,
      errorMessage: "Name Should not be Empty"
    },
    
    email: {
      type: 'string',
      format: 'email'
    }, 
    
    password: {
      type:'string',
      pattern: '^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{8,15}$',
      errorMessage: "password should contain atleast 1 Capiatal, Small and digit and length must be 8 to 15"
    },

    hospitalId: {
      type: 'string'
    }
    
  },
  required: ['name', 'email', 'password', 'hospitalId']
};
module.exports = (data) => {
  const validate =  ajv.compile(schema);
  valid = validate(data)
  
  return { valid: valid, errors: validate.errors }
}
