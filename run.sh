#!/bin/sh

git clone -b $GIT_BRANCH --depth 1 $GIT_REPO git_repo
echo "GIT_BRANCH=$GIT_BRANCH" > /.env
cd git_repo
pip install -r ./requirements.txt
service cron start
streamlit run app.py --server.port 8080