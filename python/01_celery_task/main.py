import sys
from pathlib import Path
from celery import Celery
import logging

# Настройка Celery
app = Celery(
    "tasks",
    broker="redis://localhost:6379/0",  # очередь
    backend="redis://localhost:6379/1",  # результаты
)

# Настройка логгера
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
log_path = Path(__file__).parent / "celery_task.log"

file_handler = logging.FileHandler(log_path)
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)
logger.addHandler(logging.StreamHandler())


@app.task(name="task.multiply_numbers")
def multiply_numbers(a: int, b: int) -> int:
    try:
        result = a * b
        logger.info(
            f"Успешное выполнение задачи. Входные данные: a={a}, b={b}. Результат: {result}"
        )
        return result
    except Exception as e:
        logger.error(
            f"Ошибка при выполнении задачи. Входные данные: a={a}, b={b}. Ошибка: {str(e)}"
        )
        raise


if __name__ == "__main__":
    # Пример вызова задачи
    result = multiply_numbers.delay(5, 3)
    logger.info(f"Результат задачи: {result.get()}")
