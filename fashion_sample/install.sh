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
touch ~/.bashrc
echo -e "# pyenv paths" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv -v

# Install Python and set default
pyenv install 3.7.4
pyenv global 3.7.4

# Install pipenv
pip install pipenv