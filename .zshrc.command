### Alias類
# find grep 合わせ技のエイリアス まだできていない・・・・・
# grep （数字分上下を表示[-B数字 -A数字]  再帰的[-r]）
alias grep="grep --color"

# インストールしたCpanモジュールを出力
alias pm-installed="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print"
alias pm-version='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"


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

# tmux init
## tmuxのカラー設定　itermでtmuxを使い、Vimのカラースキームを有効にする
## http://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode
alias tmux="TERM=screen-256color-bce tmux"
function tmux_init() {
  SESS='takamax'
  if [ $# -eq 1 ]; then
    SESS=$1
  fi

  tmux -f ~/.tmux.conf new-session -d -s $SESS
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:1 -n dev
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:2 -n db
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:3 -n search
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:4 -n run
  tmux -f ~/.tmux.conf attach-session -t $SESS
}



