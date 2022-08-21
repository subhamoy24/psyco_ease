'use strict';
const db = require('../models')
module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
    await db.Hospital.bulkCreate([{
      name: 'Apollo Hospital'
    },
    {
      name: "Jawaharlal Nehru Medical College and Hospital"

    },
    {
      name: "Indira Gandhi Institute of Medical Sciences(IGIMS)"
    }, 
    {
      name: "AIIMS-All India Institute of Medical Sciences"
    }
    ]);  
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
    
  }
};
