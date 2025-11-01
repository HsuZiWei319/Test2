# main.py 檔案內容

from fastapi import FastAPI

# 這是 uvicorn main:app 中的 'app'
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}