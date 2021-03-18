# Desafio programação - para vaga Back-end por [@owalmirneto](https://github.com/owalmirneto) 

## Requirimentos da applicação

- Ruby 3.0+
- Rails 6.1+

## Instale Ruby on Rails

Caso não tenha RoR instalado você pode usar [essa postagem](https://gorails.com/setup/ubuntu/20.10) caso use ubuntu, [essa](https://gorails.com/setup/osx/11.0-big-sur) caso use macOS ou ainda [essa](https://gorails.com/setup/windows/10) caso use windows

## Baixando desafio

Para baixar o código do projeto você pode acessar https://github.com/owalmirneto/desafio-ruby-backend ou usar o comando abaixo para baixar:

```bash
git clone git@github.com:owalmirneto/desafio-ruby-backend.git
```

## Installation

#### Application

Prepare a aplicação, rodando o comando:

```bash
bin/setup
```

isso vai criar os banco de dados necessários e criar o aquivo `.env`

#### Database

Execute o comando abaixo para rodar as migrations e rodar o seed:

```bash
bin/recreate_database
```

## Start application

Esse comando é só um atalho do `bin/rails s`

```bash
bin/start
```

#### CI

Esse arquivo roda todas as verificações de código

```bash
bin/ci
```

#### Brakeman

```bash
bin/brakeman
```

#### Rubocop

```bash
bin/rubocop -D -E -S # to verify
# or
bin/rubocop -D -E -S --auto-correct # to verify and fix
```

#### ERB Lint

```bash
bin/erblint app/views # to verify
# or
bin/erblint app/views --autocorrect # to verify and fix
```

#### SCSS lint

```bash
bin/scss-lint # to verify
```

#### ESLint

```bash
bin/eslint # to verify
# or
bin/eslint --fix # to verify and fix
```

#### Rspec

```bash
bin/rspec
```
