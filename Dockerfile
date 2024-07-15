FROM python:slim

RUN apt-get update && apt-get install -y git

# Install Python dependencies.
COPY requirements.txt run.sh ./
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["/bin/sh", "./run.sh"]