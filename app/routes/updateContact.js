'use strict';

const Boom = require('boom');
const Contact = require('./../models/contact');
const winston = require('winston');
const Mongoose = require('./../db/index').Mongoose;

module.exports = {
  method: 'PUT',
  path: '/contact/{id}',
  handler: (request, reply) => {
    Contact
      .findOneAndUpdate({ _id: request.params.id }, { $set: request.payload }, { new: true })
      .then((contact) => {
        console.log(request.params.id);
        console.log(contact);
        return reply({ status: 200 });
      })
      .catch(err => reply.view(Boom.badData(`Server error ${err}`)));
    // Mongoose.model('')
    // Contact.findOneAndUpdate({ id: request.params.id }, request.payload, { new: true, upsert: true, setDefaultsOnInsert: true }, function (error, result) {
    //   if (error) {
    //     console.log("Something wrong when updating data!");
    //   }

    //   console.log(result);
    // });
  }
};