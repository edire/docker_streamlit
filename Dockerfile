FROM python:3.12.5-slim

# Linux Dependencies
RUN apt-get update && \
    apt-get install -y git cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python Dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Cron Job Dependencies
COPY cron_jobs /etc/cron_jobs
COPY cron_git_update.sh ./
RUN chmod 0644 /etc/cron_jobs && \
    crontab /etc/cron_jobs && \
    touch /var/log/cron.log && \
    chmod +x /cron_git_update.sh

# App Dependencies
COPY run.sh ./
RUN chmod +x /run.sh
EXPOSE 8080

CMD ["/bin/sh", "./run.sh"]