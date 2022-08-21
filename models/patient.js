'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Patient extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.belongsTo(models.Psychiatrist);
    }
  }
  Patient.init({
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      validate: { 
        isEmail: true,
        isUnique: function(value, next) {
          Patient.findOne({
            where: { email: value},
            attributes: ['id']
          }).then(function(res){
            if(res){
              return next("Email already exist");
            }else{
              return next();
            }
          }).catch(
            (error) => {
              return next(error);
            }
          )
        }
      },
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false
    },
    phoneNumber: DataTypes.STRING,
    password: {
      type: DataTypes.STRING,
    },
    photo: {
      type: DataTypes.STRING,
      allowNull: false
    },
    psychiatristId: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Patient',
  });
  return Patient;
};