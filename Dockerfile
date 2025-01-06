FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt /app/
COPY requirements.dev.txt /app/

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r requirements.dev.txt

COPY . /app/

ENV FLASK_APP=app/app.py
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
