FROM python:3.10-slim

# Install Git
RUN apt-get update && apt-get install -y git

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY ./source /app/source

CMD ["uvicorn", "source.main:app", "--host", "0.0.0.0", "--port", "6600", "--reload"]
