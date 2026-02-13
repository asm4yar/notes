# Запустить grafana в контейнере

```yaml
  grafana:
    image: grafana/grafana
    ports:
      - "3033:3000"
    depends_on:
      - prometheus
    networks:
      - task-network
```
