'use strict';

const Boom = require('boom');
const Contact = require('./../models/contact');
const winston = require('winston');

module.exports = {
  method: 'PUT',
  path: '/contact/{id}',
  handler: (request, reply) => {
    Contact
      .findOneAndUpdate({ _id: request.params.id }, { $set: request.payload }, { new: true })
      .then((contact) => {
        winston.info(`Updated contact: ${contact.firstName} ${contact.lastName}`);
        return reply({ status: 200 });
      })
      .catch(err => reply.view(Boom.badData(`Server error ${err}`)));
  }
};