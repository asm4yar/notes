
# 1. Собрать образ приложения версии 1.0
docker build -t my-swarm-app:1.0 .

# 2. Инициализировать Swarm
docker swarm init

# 3. Создать сервис с 1 репликой (внешний порт 9090, внутренний 8800)
docker service create --name my-web --replicas 1 -p 9090:8800 my-swarm-app:1.0

# 4. Проверить список сервисов (опционально)
docker service ls

# 5. Проверить запущенные задачи (контейнеры) сервиса (опционально)
docker service ps my-web

# 6. Отмасштабировать сервис до 5 реплик
docker service scale my-web=5

# 7. Собрать образ приложения версии 2.0
docker build -t my-swarm-app:2.0 .

# 8. Обновить сервис до версии 2.0 (плавное обновление)
docker service update --image my-swarm-app:2.0 --env-add APP_VERSION=2.0 my-web

# 9. Удалить сервис, созданный вручную, чтобы освободить имя
docker service rm my-web

# 10. Развернуть стек из файла docker-compose.yml
docker stack deploy -c docker-compose.yml myapp

# 11. Проверить список запущенных стеков (опционально)
docker stack ls

# 12. Проверить сервисы внутри конкретного стека (опционально)
docker stack services myapp

# 13. Удалить весь стек, развернутый из файла
docker stack rm myapp

# 14. Выйти из режима Swarm
docker swarm leave --force

# 15. Создать том для данных Portainer
docker volume create portainer_data

# 16. Запустить сервис Portainer
docker service create \
 --name portainer \
 --publish 9443:9443 \
 --publish 8000:8000 \
 --constraint 'node.role == manager' \
 --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
 --mount type=volume,src=portainer_data,dst=/data \
 portainer/portainer-ce:latest


 