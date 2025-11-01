#指定使用一個官方的、輕量化的 Python 3.9 環境作為基礎。
FROM python:3.9-slim
#在 Docker 內部建立一個 /app 資料夾，並將它設為主要工作區。
WORKDIR /app
#將目前資料夾（第一個 .）的所有檔案，複製到 Docker 內部的 /app 工作區（第二個 .）
COPY . .
#在 Docker 內部執行指令，安裝 requirements.txt 裡面列出的所有 Python 套件。
RUN pip install --no-cache-dir -r requirements.txt
#設定當 Docker 容器啟動時，預設要執行的指令。
#這裡是啟動 uvicorn 伺服器來運行我們的 FastAPI 程式 
#(main.py 裡的 app 物件)，並讓它在 8000 埠口等待連線。--host 0.0.0.0 是讓容器可以接受來自外部的連線。
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
