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
    address: {
      type: 'string',
      minLength: 10
    },
    email: {
      type: 'string',
      format: 'email'
    }, 
    phoneNumber: {
      type: 'string',
      pattern: '^([\+]{1}[0-9]{1,3}\s)?[0-9]{10,15}$',
      errorMessage: "phone Number should between 10 to 15 with or without country code",
    },
    password: {
      type:'string',
      pattern: '^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{8,15}$',
      errorMessage: "password should contain atleast 1 Capiatal, Small and digit and length must be 8 to 15"
    },
    photo: {
      type: 'string'
    },
    psychiatristId: {
      type: 'string',
    }
  },
  required: ['name', 'email', 'address', 'password', 'photo', 'psychiatristId', 'phoneNumber']
};
module.exports = (data) => {
  const validate =  ajv.compile(schema);
  valid = validate(data)
  
  return { valid: valid, errors: validate.errors }
}
