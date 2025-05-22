from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from .database import init_db
from .routes import items
from fastapi.responses import FileResponse
import os

app = FastAPI()

# Initialize database
@app.on_event("startup")
def on_startup():
    init_db()

# Include API routes
app.include_router(items.router)

# Set correct path to frontend
frontend_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "frontend"))

# Serve static files like JS/CSS
app.mount("/static", StaticFiles(directory=frontend_dir), name="static")

# Serve index.html at root "/"
@app.get("/")
async def serve_index():
    return FileResponse(os.path.join(frontend_dir, "index.html"))
