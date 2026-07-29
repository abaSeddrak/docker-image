FROM python:3.11-slim
WORKDIR /app
RUN pip install uv
COPY requirements.txt .
RUN uv pip install -r requirements.txt --system
COPY . .
EXPOSE 8501
ENTRYPOINT ["streamlit"]
CMD ["run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]