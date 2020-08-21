## v0.0.8

add controler lojas
install bootstrap
install decorator and add

  * arquivo
  * loja
  * registro

map relationship registros on loja
add method factor to TipoDeTransacao

## v0.0.7

add modelo beneficiario

add modelo loja

update inflections

add modelo cartão

add modelo tipo_de_transacao

inclui coluna linha_no_arquivo na tabela de registros, referenciando de onde examente o registro se originou

add modelo registro

add coluna data_processado na tabela arquivo para sinalizar quando aquele arquivo foi processado por completo

add seed TipoDeTransacao

add coluna linhas na tabela arquivo para registrar o tamanho do arquivo

add CnabParser::Version01

add job ProcessArquive

add column data_processado to arquivo

add callback to process_arquive after create arquive

## v0.0.6

testes de modelo

 * Usuario
 * Arquivo

testes request

  * ArquivoController
  * SessaoController

tests view

  * arquivos/edit
  * arquivos/index
  * arquivos/new

add indice unico para coluna sha1 na tabela arquivo

## v0.0.5

add login pelo google

criado modelo Usuario

add slim

converte application.html.erb para slim

exibe foto e nome do usuario logado

## v0.0.4

criando o scaffold do modelo Arquivo

instalando active storage

calculando sha1 ao fazer upload do arquivo

exibir nome e tamanho do arquivo ao listar todos

traduzido e exibindo nome e tamanho no arquivos/show.html.erb

## v0.0.3

instalando rspec

```
rails generate rspec: install
```

add config/locales/pt-BR.yml

define idioma da aplicacao como pt-BR

## v0.0.2

Definindo diagrama de entidade relacionamento

Instalando rubocop

## v0.0.1

Criando o projeto

```
# ruby -v
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-darwin19]

# rails -v
Rails 6.0.3.2

# rails new financial_movements

# bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
```
