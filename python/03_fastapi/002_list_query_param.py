from fastapi import FastAPI, Query
from typing import Optional
import logging

app = FastAPI()

logger = logging.getLogger(__name__)
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
handler = logging.StreamHandler()
handler.setFormatter(formatter)
logger.addHandler(handler)
logger.setLevel(logging.INFO)


@app.get("/products")
async def get_products(
    categories: Optional[list[str]] = Query(
        None, alias="categories[]"
    ),  # Категории в виде списка
):
    logger.info(categories)

    return {"products": categories}


@app.get("/{id}")
async def root(id: int):
    pass
