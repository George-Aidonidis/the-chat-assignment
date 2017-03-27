'use strict';

const Mongoose = require('../db/').Mongoose;

const contactSchema = new Mongoose.Schema({
  firstName: {
    type: String,
    required: true
  },
  lastName: {
    type: String,
    required: true
  },
  email: {
    type: String,
    required: true
  },
  phone: {
    type: Number,
    required: true
  },
  work: {
    type: Number
  },
  mobile: {
    type: Number
  }
});

module.exports = Mongoose.model('Contact', contactSchema, 'contact');