'use strict';

const Contact = require('./../models/contact');
const Boom = require('boom');

module.exports = {
  method: 'GET',
  path: '/',
  handler: (request, reply) => {
    Contact
      .find({})
      .then(contacts => reply.view('index', contacts))
      .catch(err => Boom.badImplementation(err));
  }
};