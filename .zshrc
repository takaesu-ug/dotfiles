## お す す め 設 定 を 読 み 込 む
## https://github.com/clear-code/zsh.d/
source ~/.zsh.d/zshrc_takaesu


#### 以 下 自 分 用 の 設 定  ###
# $HOME binを読み込む
export PATH=$PATH:~/bin

# エディタ設定（mvim）
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## Anadroid SDK PATH
#.zlogin で設定

## ruby
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## node.js
# nodebrew
if [[ -f ~/.nodebrew/nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew use v0.6.10
fi

## perl
# perlbrew
source ~/perl5/perlbrew/etc/bashrc

# tmux init
## tmuxのカラー設定　itermでtmuxを使い、Vimのカラースキームを有効にする
## http://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode
alias tmux="TERM=screen-256color-bce tmux"
function tmux_init() {
  SESS='takamax'
  if [ $# -eq 1 ]; then
    SESS=${SESS}_$1
  fi

  tmux -f ~/.tmux.conf new-session -d -s $SESS
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:1 -n dev
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:2 -n root
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:3 -n etc
  tmux -f ~/.tmux.conf attach-session -t $SESS


}

# find grep 合わせ技のエイリアス
# grep （数字分上下を表示[-B数字 -A数字]  再帰的[-r]）
alias grep="grep --color"


# w3mでgoogle検索
function google() {
local str opt
if [ $ != 0 ]; then
    for i in $*; do
        str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

# w3mでALC検索
function alc() {
if [ $ != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
    w3m "http://www.alc.co.jp/"
fi
}

