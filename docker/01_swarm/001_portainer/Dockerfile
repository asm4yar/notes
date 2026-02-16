# Шаг 1: Базовый образ Python 3.10
FROM python:3.10-slim

# Шаг 2: Рабочая директория внутри контейнера
WORKDIR /app

# Шаг 3: Устанавливаем Poetry
RUN pip install poetry
RUN poetry config virtualenvs.create false

# Шаг 4: Копируем файлы зависимостей для кеширования
COPY pyproject.toml poetry.lock ./

# Шаг 5: Устанавливаем зависимости
RUN poetry install --no-root

# Шаг 6: Копируем весь код приложения
COPY . .

# Шаг 7: Команда для запуска приложения
CMD ["python", "app.py"]