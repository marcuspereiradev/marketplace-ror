## About

This is a marketplace made with Ruby On Rails.

## Getting Started

1 - You must have installed mongodb

```bash
https://docs.mongodb.com/manual/installation/#mongodb-community-edition-installation-tutorials
```

2 - Clone the application and run inside the directory.

```bash
bundle install
```

3 - Now you must to start mongodb in terminal and after start server

```bash
sudo service mongod start
```
```bash
rails server
```

For create a store/client and add some product you must sign up through rails admin

```bash
http://localhost:3000/admin
```

When one client is save some products are added automatically by api but the field website added
must be a VTEX store that use the same api endpoint. For example:

https://www.fossil.com.br
https://www.montecarlo.com.br/
https://www.lojasmartex.com.br/
https://loja.europa.com.br/
