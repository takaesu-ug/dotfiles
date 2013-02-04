## お す す め 設 定 を 読 み 込 む

## https://github.com/clear-code/zsh.d/
source ~/dotfiles/zsh.d/zshrc_takaesu

## gitの補完をzshでも爆速に
#結局使わなかった！！#zshをｖｅｒ5にしたら解決
#refs http://project-p.jp/halt/?p=1701
#source ~/dotfiles/.git-completion.bash


#### 以 下 自 分 用 の 設 定  ###
# $HOME binを読み込む
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# オリジナルコマンドの読み込み
source ~/dotfiles/.zshrc.command

## Anadroid SDK PATH
#.zlogin で設定

## node.js
# nodebrew
if [[ -f ~/.nodebrew/nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew use v0.6.10
fi

## perl
# perlbrew
if [[ -f ~/perl5/perlbrew/etc/bashrc ]]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

