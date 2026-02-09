from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse

app = FastAPI()


class MyException(Exception):
    def __init__(self, message: str):
        self.message = message


@app.exception_handler(MyException)
async def my_exeption_handler(request: Request, exc: MyException):
    return JSONResponse(
        status_code=400,
        content={
            "error": "MyException",
            "message": exc.message,
            "path": str(request.url),
        },
    )


@app.get("/test-error")
async def test_error():
    raise MyException("Что-то пошло не так")
