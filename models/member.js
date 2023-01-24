'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class member extends Model {
    static associate(models) {
      // define association here
      this.hasMany(models.borrow, {
        foreignKey: 'memberID', as: 'borrow'
      })
    }
  }
  member.init({
    name: DataTypes.STRING,
    gender: DataTypes.STRING,
    contact: DataTypes.STRING,
    address: DataTypes.STRING,
    profilM: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'member',
  });
  return member;
};