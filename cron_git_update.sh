#!/bin/bash
source /.env
cd /git_repo
git fetch --depth 1
git merge origin/$GIT_BRANCH
echo "Git Repo updated at $(date)"