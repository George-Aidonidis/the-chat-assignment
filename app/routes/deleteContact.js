'use strict';

const Contact = require('./../models/contact');
const Boom = require('boom');

module.exports = {
  method: 'DELETE',
  path: '/delete/{id}',
  handler: (request, reply) => {
    Contact
      .findOneAndRemove({ _id: request.params.id })
      .then((contact) => {
        if (contact) {
          reply(`removing contact ${contact}`);
          contact.remove();
        } else {
          reply('contact does not exist');
        }
      })
      .catch(err => reply(Boom.badImplementation(err)));
  }
};