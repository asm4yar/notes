# Импортируем asyncio для работы с асинхронными функциями
import asyncio


# Асинхронная функция task_one
async def task_one():
    print("Task 1 started")
    await asyncio.sleep(3)
    print("Task 1 finished")


# Асинхронная функция task_two
async def task_two():
    print("Task 2 started")
    await asyncio.sleep(2)
    print("Task 2 finished")


# Асинхронная функция main для запуска задач одновременно
async def main():
    tasks = [task_one(), task_two()]
    await asyncio.gather(*tasks)


# Запуск основной функции main через asyncio.run
if __name__ == "__main__":
    asyncio.run(main())
