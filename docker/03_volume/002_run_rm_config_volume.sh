# Создайте том с именем config_volume
docker volume create config_volume

# Запустите временный контейнер и запишите в том файл конфигурации
docker run --rm -v config_volume:/app/config alpine:latest sh -c '
cat > /app/config/db.yml << "EOF"
key: value
EOF
'

# Запустите еще один временный контейнер, чтобы проверить содержимое тома с помощью команды ls
docker run --rm -v config_volume:/app/config nginx:latest sh -c "ls -la /app/config/db.yml"

# Вывод содержимого файла конфигурации
docker run --rm -v config_volume:/app/config postgres:latest  \
  sh -c 'echo "----- /app/config/db.yml -----"; cat /app/config/db.yml'

