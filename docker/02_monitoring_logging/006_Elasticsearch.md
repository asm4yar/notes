# Установка в контейнер

```yml
    elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.15.0
    environment:
      - discovery.type=single-node
    ports:
      - "9200:9200"
    networks:
      - task-network
```

## Создание файла конфигурации logstash.conf

Создание директории для конфигурации Logstash:**

```sh
mkdir logstash
cd logstash
```

```conf
input {
  beats {
    port => 5044
  }
}
filter {
  json {
    source => "message"
  }
}
output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "docker-logs-%{+YYYY.MM.dd}"
  }
}
```

## Создание Dockerfile для `Logstash`

``` docker
FROM docker.elastic.co/logstash/logstash:8.15.0
COPY logstash.conf /usr/share/logstash/pipeline/logstash.conf
```

## TODO
