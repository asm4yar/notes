from fastapi import (
    FastAPI,
    Path,
)  # Импортируем FastAPI и класс Path для валидации параметров пути

# Инициализируем приложение FastAPI
app = FastAPI()


# Определяем маршрут с параметром пути item_id
@app.get("/items/{item_id}")
def read_item(item_id: int = Path(ge=1, le=100)):
    # Возвращаем JSON-ответ с ключом "item_id" и переданным значением
    return {"item_id": item_id}
