#!/bin/sh

git clone https://github.com/riywo/anyenv ~/.anyenv

# anyenv init
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
anyenv install --init

echo '# anyenv init' >> ~/.zshrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
echo 'export LANG=en_US.UTF-8' >> ~/.zshrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(anyenv init -)"' >> ~/.zshrc

# anyenv plugins
mkdir -p $(anyenv root)/plugins

git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git

anyenv update
anyenv git pull

# XXenv install
anyenv install nodenv
anyenv install rbenv
anyenv install pyenv
anyenv install goenv
