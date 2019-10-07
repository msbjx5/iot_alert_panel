# IOT Panel

### Stack

* Ruby 2.6.3
* Rails 5.2.3
* Postgresql 12

### Sobre o projeto

Painel de cadastro para gerência de dispositívos de monitoração. O painel em si
é um CRUD simples, com uma API com dois endpoints que são descritos mais abaixo.
A principal feature desse painel é a geração de alertas automatizados usando o grafana
 e o twilio. A ideia é que seja um sistema acoplavel com qualquer datasource aceito pelo grafana.

Toda configuração do grafana é feita de maneira declarativa, para alterar suas configurações voce deve alterar diretamente nos arquivos de configuração. Dentro da pasta grafana temos os seguintes arquivos:

* `dashboards` - pasta com as dashboards em si, que são gerados pelo painel.

* `provisioning` - pasta com arquivos de configurações.

* `provisioning/dashboards/all.yml` - config das dashboards, em qual pasta estão.

* `provisioning/datasources/influx.yml` - modelo para configuração do datasource, no exemplo é usado o influx mas você pode usar qualquer um que seja aceito pelo grafana.

* `provisioning/notifiers/api.yml` - pasta com arquivos de configurações

Também temos a configuração inicial `config.ini`, o `Dockerfile`, e o `model.json` que é o modelo de dashboard padrão, mude esse arquivo conforme sua necessidade.

### Instalação

* `git clone git@github.com:matheusam/iot_alert_panel.git`
* `cd iot_alert_panel`
* Para iniciar os serviços
* `docker-compose build && docker-compose up`
* Para acessar o container web
* `docker-compose exec web bash`
* Para rodar os testes
* `bundle exec rspec`

O servidor web estará disponível na porta `80` e o grafana na porta `8080`.

### API

#### Consulta
Consulta um MAC, e deve ser retornado o nome e telefone no cadastro. e.g:

`curl http://localhost/api/v1/search/<MAC_ADDRESS>`

#### Alertas
Para gerar alertas por SMS envie um post com o MAC do dispositívo. e.g:

`curl -d "mac=<MAC_ADDRESS>" http://localhost/api/v1/alert`
