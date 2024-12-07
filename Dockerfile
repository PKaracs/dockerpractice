FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt debugpy

COPY . .

EXPOSE 5001 5678

ENV FLASK_APP=app.py
ENV FLASK_ENV=development

# Start with debugpy
CMD ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "-m", "flask", "run", "--host=0.0.0.0", "--port=5001"]