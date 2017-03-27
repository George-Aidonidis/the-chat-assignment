'use strict';

const Mongoose = require('mongoose');
const Config = require('./../config');
const winston = require('winston');

Mongoose.Promise = global.Promise;
Mongoose.connect(`mongodb://${Config.mongo.url}/${Config.mongo.database}`);
const db = Mongoose.connection;

db.on('error', err => winston.error(err));
db.once('open', () => {
  winston.log(`Database started: ${Config.mongo.url}${Config.mongo.database}`);
});

module.exports = {
  Mongoose, db
};