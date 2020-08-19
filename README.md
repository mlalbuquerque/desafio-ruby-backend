# Desafio Ruby Backend

###### Desenvolvido por Caio Nascimento (@caio-nas) - https://www.linkedin.com/in/caiomvnascimento/

### Requirements

- docker-compose version 1.23
- internet connection to download containers


### How to run

```
-- If you have Make installed
  make setup

-- Otherwise
  docker-compose run --rm web bundle install
  docker-compose up -d
  docker-compose exec web yarn install --check-files
  docker-compose exec web bundle exec rails db:setup
```

It will build the docker containers and start the application. This could take a while :-)
(depends on )

After that, you can see Rails top page on http://localhost:3000/.

### How to use

1. Login with credentials:

- email: admin@example.com
- password: 123@qwe

2. On 'Import entries', upload a bank fixed format file (CNAB) - get the [sample](https://github.com/mlalbuquerque/desafio-ruby-backend/blob/master/CNAB.txt) or [DIY](https://github.com/mlalbuquerque/desafio-ruby-backend/blob/master/README.md#documenta%C3%A7%C3%A3o-do-cnab)

3. On 'stores', now you can see all imported stores. Click on 'show' to get details about transactions and current account balance
