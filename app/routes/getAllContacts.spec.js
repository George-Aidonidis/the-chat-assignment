'use strict';

const sinon = require('sinon');
const request = require('supertest-as-promised');
const mongoose = require('mongoose');
const winston = require('winston');

mongoose.Promise = global.Promise;
const app = require('./../../server');
const Contact = require('./../models/contact');
const Config = require('./../config');

const db = mongoose.connection;

describe('Get all contacts', () => {
  before((done) => {
    db.on('error', err => winston.error(err));
    db.once('open', () => {
      mongoose.connect(`mongodb://${Config.mongo.url}/${Config.mongo.database}`);
      winston.log(`Database started: ${Config.mongo.url}${Config.mongo.database}`);
      done();
    });
  });
  after((done) => {
    db.collections.contact.drop(() => done());
    Contact.model = {};
    mongoose.modelSchemas = {};
    db.close();
  });
  it('should return all contacts', (done) => {
    const ContactMock = sinon.mock(Contact);
    ContactMock.expects('find').resolves([]);
    const expected = { status: true, contacts: [] };
    ContactMock
      .expects('find')
      .yields(null, expected)
      .then((res) => {
        request(app)
          .get('/')
          .send({ res })
          .expect(201);
        done();
      });
  });
});