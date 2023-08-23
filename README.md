
# Flutter web com Docker,  Docker Compose e CI com GitLab

Este projeto faz parte dos meus estudos de containers com Docker Compose e pretende disponibilizar uma aplicação web padrão do flutter em uma imagem de servidor web apache [httpd](https://hub.docker.com/_/httpd)

## Executando

Você pode rodar o projeto com o Docker e com o Docker Compose.

1. Gerar a build: execute o comando `flutter build web` para gerar os arquivos minificados para web.

### Instalação

- [Docker](https://docs.docker.com/).
- [Docker Compose](https://docs.docker.com/compose/install/)

### Comandos para Docker Compose

2. Subir o container Apache com a aplicação: execute o comando `docker compose up -d`

### Comando para Docker

2. Subir o container Apache coma  aplicação: execute o comando `docker run -d -p 80:80 meuapp-apache:latest`