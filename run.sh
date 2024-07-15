#!/bin/sh

git clone -b $GIT_BRANCH --depth 1 $GIT_REPO git_repo
cd git_repo
pip install -r ./requirements.txt
streamlit run app.py --server.port 8080