FROM python:slim

RUN apt-get update && apt-get install -y git

# Install Python dependencies.
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY run.sh ./
EXPOSE 8080

CMD ["/bin/sh", "./run.sh"]