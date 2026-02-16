from flask import Flask
import socket
import os

app = Flask(__name__)

APP_VERSION = os.environ.get('APP_VERSION', '1.0')


@app.route('/')
def hello():
    hostname = socket.gethostname()
    return f"<h1>Hello from Swarm!</h1><p>Version: {APP_VERSION}</p><p>Container ID: {hostname}</p>"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8800)
