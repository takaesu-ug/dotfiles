## お す す め 設 定 を 読 み 込 む
## https://github.com/clear-code/zsh.d/
source ~/.zsh.d/zshrc_takaesu


#### 以 下 自 分 用 の 設 定  ###
# $HOME binを読み込む
export PATH=$PATH:~/bin

# オリジナルコマンドの読み込み
source ~/dotfiles/.zshrc.command


# エディタ設定（mvim）
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

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
source ~/perl5/perlbrew/etc/bashrc







