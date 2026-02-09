from fastapi import FastAPI
import httpx
import asyncio

app = FastAPI()


# Асинхронный эндпоинт для выполнения двух параллельных запросов

@app.get("/combine")
async def combine():
    urls = [
        "https://jsonplaceholder.typicode.com/posts/1",
        "https://jsonplaceholder.typicode.com/posts/2"
    ]
    async with httpx.AsyncClient() as client:
        responses = await asyncio.gather(*(fetch_url(client, url) for url in urls))

    return {f"data_{i + 1}": data for i, data in enumerate(responses)}


async def fetch_url(client, url):
    response = await client.get(url)
    return response.json()
