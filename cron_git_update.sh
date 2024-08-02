#!/bin/bash
source /.env
cd /git_repo
git fetch origin $GIT_BRANCH
git reset --hard origin/$GIT_BRANCH
/usr/local/bin/python -m pip install -r /git_repo/requirements.txt
echo "Git Repo updated at $(date)"