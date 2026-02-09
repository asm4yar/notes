Отключить hash в имени автоматически

Можно изменить шаблон в alembic.ini:

Найди:

```ini
file_template = %%(rev)s_%%(slug)s
```


И замени на:

```ini
file_template = %%(slug)s
```

