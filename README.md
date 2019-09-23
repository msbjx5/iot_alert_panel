# ConnecTI Panel

### Stack

* Ruby 2.6.3
* Rails 5.2.3
* Postgresql 12
* Docker
* Docker compose

### Sobre o projeto

Painel de cadastro para gerência de dispositívos(Devices) e API de integração
com o daemon.

### Instalação

* `git clone git@github.com:connectibr/connecti_panel.git`
* `cd connecti_panel`
* Para iniciar os serviços
* `docker-compose build && docker-compose up`
* Para acessar o container web
* `docker-compose exec web bash`
* Para criar o banco a primeira vez
* `bin/setup`

O servidor web estará disponível na porta `80`.

### API

Por enquanto teremos apenas o endpoint de consulta, na qual será fornecido um mac,
e deve ser retornado o nome e telefone no cadastro. e.g:

`payload = { mac: ffffffffffff}`

`post 'http://localhost/api/v1/search', params: payload`
