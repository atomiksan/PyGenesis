from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello World from your Nix+UV Python Skeleton!"}

@app.get("/items/{item_id}")
def read_item(item_id: int):
    return {"item_id": item_id, "message": "It works!"}

def main():
    """Entry point for the application script"""
    uvicorn.run("my_project.main:app", host="0.0.0.0", port=8000, reload=True)

if __name__ == "__main__":
    main()
