from fastapi import FastAPI
import uvicorn
from importlib.metadata import metadata

# Get project name from package metadata
PROJECT_NAME = metadata("my-backend-project").get("Name", "my_project")

app = FastAPI(title=PROJECT_NAME)


@app.get("/")
def read_root():
    return {"message": f"Hello {PROJECT_NAME}! Your PyGenesis skeleton is working!"}


@app.get("/items/{item_id}")
def read_item(item_id: int):
    return {"item_id": item_id, "message": "It works!"}


def main():
    """Entry point for the application script"""
    uvicorn.run("my_project.main:app", host="0.0.0.0", port=8000, reload=True)


if __name__ == "__main__":
    main()
