FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Make sure we expose port 8080
EXPOSE 8080
ENV PORT 8080

# Use this command to run with gunicorn
CMD exec gunicorn --bind :$PORT app:app