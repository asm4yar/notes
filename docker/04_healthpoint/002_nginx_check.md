# Использование Healthcheck nginx

```yml
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
    healthcheck:
      test: ["CMD-SHELL", "curl -f http://locahost || exit 1"]
      interval: 30s
      timeout: 10s
      retries: 3      
```
