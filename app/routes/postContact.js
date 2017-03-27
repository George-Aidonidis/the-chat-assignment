'use strict';

const Boom = require('boom');
const Contact = require('./../models/contact');
const winston = require('winston');

module.exports = {
  method: 'POST',
  path: '/create',
  handler: (request, reply) => {
    const contact = new Contact(request.payload);
    contact
      .save()
      .then((result) => {
        winston.log(result);
        return reply({ status: 200 });
      })
      .catch(err => reply.view(Boom.badData(`Server error ${err}`)));
  }
};