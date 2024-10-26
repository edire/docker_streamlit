#!/bin/sh

mkdir -p ~/.ssh
cat $SSH_KEY > ~/ssh_key
chmod 600 ~/ssh_key
cat <<EOL >> ~/.ssh/config
Host github.com
    HostName github.com
    User git
    IdentityFile ~/ssh_key
EOL
ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts
git clone -b $GIT_BRANCH --depth 1 $GIT_REPO git_repo
echo "GIT_BRANCH=$GIT_BRANCH" > /.env
cd git_repo
pip install -r ./requirements.txt
service cron start
streamlit run app.py --server.port 8080