# The chat PhoneBook

A simple phone book web-app created with `riot.js`, `hapi.js`. It allows the user to do basic `CRUD` operations with the phone book contacts.

![alt-text](http://preview.ibb.co/kchugF/Screenshot_from_2017_03_28_11_11_05.png)

* The `index` view shows all the contacts (only name is displayed). The trash icon deletes the contact.
* Clicking on a contact opens the `detail` page where the user can see all contact's details and edit the properties.
* The create page allows the user to create a new contact.

For local development, use the following:
```bash
$ env MONGODB_URI='mongodb://localhost:27017' npm run watch:server
```

Heroku [link](https://chatshop-phonebook.herokuapp.com/)

_Developed for the purposes of `The Chat Shop`_