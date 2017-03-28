'use strict';

const dbuser = '';
const dbpassword = '';

const settings = {
  mongo: {
    url: '',
    database: 'the-chat-room-assignment'
  },
  server: {
    host: '0.0.0.0',
    port: 3000
  }
};

module.exports = () => {
  switch (process.env.NODE_ENV) {
    case 'development':
      settings.mongo.url = '0.0.0.0:27017';
      return settings;
    case 'production':
      if (process.env.MONGOLAB_URI) {
        settings.mongo.url = process.env.MONGOLAB_URI;
      } else {
        settings.mongo.url = `${dbuser}:${dbpassword}@ds143900.mlab.com:43900`;
      }
      return settings;
    default:
      return settings;
  }
};