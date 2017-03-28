'use strict';

const dbuser = 'user';
const dbpassword = 'password';

const settings = {
  mongo: {
    url: '',
    database: 'the-chat-room-assignment'
  },
  server: {
    host: '0.0.0.0',
    port: process.env.PORT
  }
};

module.exports = () => {
  switch (process.env.NODE_ENV) {
    case 'development':
      settings.mongo.url = '0.0.0.0:27017';
      return settings;
    case 'production':
      settings.mongo.url = `${dbuser}:${dbpassword}@ds143900.mlab.com:43900`;
      return settings;
    default:
      return settings;
  }
};