#!/bin/bash

# Install dependencies
echo "ユーザのパスワード" | sudo apt update && sudo apt install -y --no-install-recommends \
        build-essential \
        libffi-dev \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        git

# Download pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Update .bash_profile
touch ~/.bash_profile
echo -e "# pyenv paths" >> ~/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
pyenv -v

# Install Python and set default
pyenv install 3.7.4
pyenv global 3.7.4

# Install pipenv
pip install pipenv