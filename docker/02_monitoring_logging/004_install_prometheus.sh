
# Prometheus — это мощная система мониторинга и оповещения с открытым исходным кодом, разработанная для сбора и хранения метрик из различных источников, включая Docker-контейнеры. В этой лекции мы подробно рассмотрим процесс настройки мониторинга контейнеров с помощью Prometheus, включая установку, настройку сбора метрик и интеграцию с Docker.


wget https://github.com/prometheus/prometheus/releases/download/v2.30.3/prometheus-2.30.3.linux-amd64.tar.gz

tar xvfz prometheus-*.tar.gz
cd prometheus-*

sudo mv prometheus /usr/local/bin/
sudo mv promtool /usr/local/bin/

# Создайте или отредактируйте файл `prometheus.yml`:

# global:
#   scrape_interval: 15s  # Интервал сбора метрик
      
# scrape_configs:
#   - job_name: 'prometheus'
#     static_configs:
#       - targets: ['localhost:9090']
      
#   - job_name: 'cadvisor'
#     static_configs:
#       - targets: ['localhost:8080']

