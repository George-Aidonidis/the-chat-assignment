'use strict';

const Contact = require('./../models/contact');
const Boom = require('boom');

module.exports = {
  method: 'GET',
  path: '/contact/{id}',
  handler: (request, reply) => {
    Contact
      .findById(request.params.id)
      .then(contact => {
        console.log(request.params.id);
        console.log(contact);
        reply.view('contactDetail', contact);
      })
      .catch(err => reply(Boom.badImplementation(err)));
  }
};