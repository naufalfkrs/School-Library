'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class book extends Model {
    static associate(models) {
      // define association here
      this.hasMany(models.details_of_borrow, {
        foreignKey: 'bookID', as: 'details_of_borrowed'
      })
    }
  }
  book.init({
    isbn: DataTypes.STRING,
    title: DataTypes.STRING,
    author: DataTypes.STRING,
    publisher: DataTypes.STRING,
    category: DataTypes.STRING,
    stock: DataTypes.INTEGER,
    cover: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'book',
  });
  return book;
};