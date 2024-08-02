#!/bin/bash
source /.env
cd /git_repo
git fetch --depth 1
git merge origin/$GIT_BRANCH
/usr/local/bin/python -m pip install -r /git_repo/requirements.txt
echo "Git Repo updated at $(date)"