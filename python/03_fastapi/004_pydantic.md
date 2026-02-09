
# Таблица основных параметров в pydantic.Field

```python
# Pydantic модель для валидации данных пользователя
class User(BaseModel):
    # Поле username: строка с ограничением от 3 до 20 символов
    username: str = Field(min_length=3, max_length=20)
    # Поле email: строка, проверяемая на соответствие формату email
    email: EmailStr
    # Поле age: целое число, должно быть больше 17
    age: int = Field(gt=17)
```

## Числа (`int`, `float`, `Decimal`)

| Параметр      | Расшифровка        | Условие            | Пример                     |
|---------------|--------------------|--------------------|----------------------------|
| `gt`          | greater than       | `>`                | `Field(gt=0)`              |
| `ge`          | greater or equal   | `>=`               | `Field(ge=0)`              |
| `lt`          | less than          | `<`                | `Field(lt=100)`            |
| `le`          | less or equal      | `<=`               | `Field(le=100)`            |
| `multiple_of` | кратно             | `value % n == 0`   | `Field(multiple_of=5)`     |
| `allow_inf_nan` | разрешить `inf` и `NaN` | `bool`       | `Field(allow_inf_nan=True)`|

---

## Строки (`str`)

| Параметр       | Значение            | Пример                         |
|----------------|---------------------|--------------------------------|
| `min_length`   | минимальная длина   | `Field(min_length=3)`          |
| `max_length`   | максимальная длина  | `Field(max_length=50)`         |
| `pattern`      | regex-шаблон        | `Field(pattern=r"^[a-z]+$")`   |

---

## Списки / коллекции (`list`, `set`, `tuple`)

| Параметр     | Значение            | Пример                    |
|--------------|---------------------|---------------------------|
| `min_length` | минимум элементов   | `Field(min_length=1)`     |
| `max_length` | максимум элементов  | `Field(max_length=10)`    |

---

## Общие параметры `Field`

| Параметр          | Назначение                         |
|-------------------|------------------------------------|
| `default`         | значение по умолчанию              |
| `default_factory` | функция для генерации значения     |
| `title`           | заголовок поля в схеме             |
| `description`     | описание                           |
| `alias`           | альтернативное имя                 |
| `deprecated`      | пометка устаревшего поля           |
| `examples`        | примеры значений                   |