#!/bin/sh

git clone https://github.com/riywo/anyenv ~/.anyenv

# anyenv init
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

echo '# anyenv init' >> ~/.bash_profile
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bash_profile
echo 'export LANG=en_US.UTF-8' >> ~/.bash_profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile

# anyenv plugins
mkdir -p $(anyenv root)/plugins

git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git

anyenv update
anyenv git pull

# XXenv install
anyenv install ndenv
anyenv install rbenv
anyenv install pyenv
anyenv install goenv
