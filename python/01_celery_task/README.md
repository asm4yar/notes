# Пример использования Celery Task + Logging

Запустить Celery Worker

```bash
celery -A main worker -l info
python main.py # отправить задачу на выполнение
```
