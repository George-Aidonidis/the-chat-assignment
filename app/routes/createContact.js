'use strict';

module.exports = {
  method: 'GET',
  path: '/create',
  handler: (request, reply) => reply.view('createContact', {})
};