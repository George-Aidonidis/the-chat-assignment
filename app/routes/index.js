'use strict';

const getAllContacts = require('./getAllContacts');
const postContact = require('./postContact');
const getContact = require('./getContact');
const deleteContact = require('./deleteContact');
const createContact = require('./createContact');
const updateContact = require('./updateContact');

module.exports = [
  getAllContacts,
  postContact,
  getContact,
  deleteContact,
  createContact,
  updateContact
];