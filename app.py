import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return f"Szevasz, version: {os.getenv('APP_VERSION', 'dev')}\n"

@app.route("/healthz")
def healthz():
    return "ok\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
