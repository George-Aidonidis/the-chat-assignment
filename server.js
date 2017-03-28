'use strict';

const Hapi = require('hapi');
const Path = require('path');
const Inert = require('inert');
const Hoek = require('hoek');
const Vision = require('vision');
const winston = require('winston');
const HapiRiot = require('hapi-riot');
const routes = require('./app/routes');

const server = new Hapi.Server();
server.connection({ port: process.env.PORT || 3000 });

server.register([Vision, Inert], (err) => {
  Hoek.assert(!err, err);
  server.views({
    engines: {
      tag: HapiRiot
    },
    path: 'app/tags',
    relativeTo: __dirname,
    compileOptions: {
      layoutPath: Path.join(__dirname, 'app/layout'),
      layout: 'layout.html',
      compiledFileRoute: '/bundle.js'
    }
  });
  server.route(routes);

  server.route({
    method: 'GET',
    path: '/public/{path*}',
    handler: {
      directory: {
        path: './app/public',
        listing: false,
        index: false
      }
    }
  });
  server.route({
    method: 'GET',
    path: '/bundle.js',
    handler: (request, reply) => {
      reply.file(Path.join(__dirname, 'bundle.js'));
    }
  });
  server.start((err) => {
    if (err) {
      throw err;
    }
    winston.info(`Server running at: ${server.info.uri} with ${process.env.NODE_ENV} settings`);
  });
});