'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Member extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Member.init({
    _id: {
      type: DataTypes.STRING,
      primaryKey: true
    },
    name: DataTypes.STRING,
    balance: DataTypes.INTEGER,
    transportation: DataTypes.STRING
  }, {
    sequelize,
    schema: 'public',
    tableName: 'Members',
    modelName: 'Member',
    timestamps: false
  });
  return Member;
};