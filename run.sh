#!/bin/sh

mkdir -p ~/.ssh
cp /volume/git_mm_docker /volume/git_mm_docker.pub ~/.ssh/
# echo -e "Host github.com\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/git_mm_docker" >> ~/.ssh/config
cat <<EOL >> ~/.ssh/config
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/git_mm_docker
EOL
ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts
git clone -b $GIT_BRANCH --depth 1 $GIT_REPO git_repo
echo "GIT_BRANCH=$GIT_BRANCH" > /.env
cd git_repo
pip install -r ./requirements.txt
service cron start
streamlit run app.py --server.port 8080