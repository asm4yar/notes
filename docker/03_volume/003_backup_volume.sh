# Создайте том с именем app_data
docker volume create app_data

# Запустите контейнер с Nginx, монтируя том app_data для хранения данных
docker run -d -v app_data:/var/www --name app-nginx  nginx:latest

# Запишите тестовый файл в том (например, index.html)
docker exec app-nginx sh -c '
cat > /var/www/index.html << "EOF"
Hello world!
EOF
'

# Создайте бэкап данных тома app_data и сохраните его на хосте в виде архива
docker run --rm \
  -v app_data:/data:ro \
  -v "$(pwd)":/backup \
  alpine:latest \
  sh -c 'tar -czf /backup/app_data.tar.gz -C /data .'


# Проверьте, что бэкап создан в текущей директории
ls -lh ./app_data.tar.gz

