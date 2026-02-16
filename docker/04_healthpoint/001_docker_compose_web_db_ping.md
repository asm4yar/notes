# Docker Compose: Web + DB Ping

## Цель

Подготовить `docker-compose.yml` с двумя сервисами: `web` и `database` (MySQL), где веб-контейнер **дожидается готовности базы** и подтверждает, что она доступна по сети.

## Требования

- Использовать Docker Compose версии `3.8`.
- `database` — `mysql:5.7` с заданным `MYSQL_ROOT_PASSWORD`.
- `web` — контейнер на базе Alpine.
- `web` должен:
  - дождаться открытия TCP-порта `3306` у MySQL;
  - дождаться ответа команды `mysqladmin ping`;
  - вывести сообщение об успешной проверке.

```yml
version: '3.8'

services:
  web:
    image: alpine
    container_name: web_server
    command: >
      sh -lc "
        apk add --no-cache mysql-client netcat-openbsd >/dev/null;
        echo 'Waiting for MySQL TCP 3306...';
        until nc -z database 3306; do sleep 1; done;
        echo 'Waiting for MySQL to be ready...';
        until mysqladmin ping -h database -uroot -pexample --silent; do sleep 1; done;
        echo '✅ MySQL is reachable and responding to ping';
        tail -f /dev/null
      "
    depends_on:
      - database
    networks:
      - webnet

  database:
    image: mysql:5.7
    container_name: database
    environment:
      MYSQL_ROOT_PASSWORD: example
    networks:
      - webnet

networks:
  webnet:
    driver: bridge
```
