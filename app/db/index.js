'use strict';

const Mongoose = require('mongoose');
const winston = require('winston');

Mongoose.Promise = global.Promise;

Mongoose.connect(process.env.MONGODB_URI);

const db = Mongoose.connection;

db.on('error', err => winston.error(err));
db.once('open', () => {
  winston.log(`Database started: ${process.env.MONGODB_URI}`);
});

module.exports = {
  Mongoose, db
};