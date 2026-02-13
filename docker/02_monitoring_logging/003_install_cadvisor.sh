# `cAdvisor` (Container Advisor) — это инструмент для мониторинга контейнеров, который собирает и предоставляет метрики для контейнеров Docker. Для его использования выполните следующие шаги:

docker run -d \
  --name=cadvisor \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --privileged \
  gcr.io/cadvisor/cadvisor:latest
  