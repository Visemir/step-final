FROM python:3.11-slim

WORKDIR .

COPY app.py /app

RUN pip install flask

EXPOSE 5000

CMD ["python", "app.py"]
