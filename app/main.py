"""ShipIt: a tiny API we'll deploy everywhere this week."""
import os
import socket
from datetime import datetime, timezone

from fastapi import FastAPI

app = FastAPI(title="ShipIt")


@app.get("/")
def root():
    return {"app": "ShipIt", "message": "Hello from devbox!", "host": socket.gethostname()}


@app.get("/health")
def health():
    return {"status": "ok", "time": datetime.now(timezone.utc).isoformat()}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str | None = None):
    return {"item_id": item_id, "q": q}


@app.get("/version")
def version():
    return {"version": "1.0.0", "env": os.getenv("APP_ENV", "unknown")}
