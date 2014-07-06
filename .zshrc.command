# エディタの設定をvimにする
export EDITOR=vim

### Alias類
alias -g L='| less'
alias -g G='| grep'

# MacVim
if [[ -f $HOME/Applications/MacVim.app/Contents/MacOS/Vim ]]; then
  alias vi='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# Ruby のctag用
alias rtags='ctags -R -a --sort=yes --exclude="*.js" --exclude="*.h" --exclude=log --exclude="*.yml" --exclude=".git"'

# Sublime Text 2
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl "$@"'
# IDE起動
alias eclipse='open -n /Applications/eclipse/Eclipse.app'
alias idea='open -n /Applications/IntelliJ\ IDEA\ 12\ CE.app'

# find grep 合わせ技のエイリアス まだできていない・・・・・
# grep （数字分上下を表示[-B数字 -A数字]  再帰的[-r]）
alias grep="grep --color"

# agコマンドの結果をlessにパイプ カラー表示とlessを閉じても画面に残す設定
alias ag="ag --pager='less -R --no-init --quit-if-one-screen'"

# diffコマンドをカラーにする
alias diff="colordiff"

# SVN関連
alias svn-vim-diff='svn diff "$@" |vim -R -'

# インストールしたCpanモジュールを出力
alias pm-installed="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print"
alias pm-version='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"


# z コマンド補完ツール
if [[ -f `brew --prefix`/etc/profile.d/z.sh ]]; then
  source `brew --prefix`/etc/profile.d/z.sh
  function precmd () {
    _z --add "$(pwd -P)"
  }
fi

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
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:1 -n dev1
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:2 -n dev2
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:3 -n dev3
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:4 -n db
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:5 -n run
  tmux -f ~/.tmux.conf attach-session -t $SESS
}

# whoisコマンドエイリアス(日本語文字化け対応） aliasコマンドでは引数を処理できないようだ
if [ -f `brew --prefix`/bin/nkf ]; then
  function whois() {
    /usr/bin/whois $@ | `brew --prefix`/bin/nkf -w
  }
fi

# w3mでgoogle検索
function google() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
        str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'` #行頭の+を除く
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt
}

# w3mでALC検索
function alc() {
  if [ $# != 0 ]; then
    w3m +38 "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
  else
    w3m "http://www.alc.co.jp/"
  fi
}

# w3m でGoogle translate English->Japanese
function gte() {
  google_translate "$*" "en-ja"
}

# w3m でGoogle translate Japanese->English
function gtj() {
  google_translate "$*" "ja-en"
}

# 実行方法
# google_translate "検索文字列" [翻訳オプション(en-ja 英語->日本語)]
function google_translate() {
  local str opt cond

  if [ $# != 0 ]; then
    str=`echo $1 | sed -e 's/  */+/g'` # 1文字以上の半角空白を+に変換
    cond=$2
    if [ $cond = "ja-en" ]; then
      # ja -> en 翻訳
      opt='?hl=ja&sl=ja&tl=en&ie=UTF-8&oe=UTF-8'
    else
      # en -> ja 翻訳
      opt='?hl=ja&sl=en&tl=ja&ie=UTF-8&oe=UTF-8'
    fi
  else
    opt='?hl=ja&sl=en&tl=ja&ie=UTF-8&oe=UTF-8'
  fi

  opt="${opt}&text=${str}"
  w3m +13 "http://translate.google.com/${opt}"
}


## pecoを使ったコマンド関連
if [[ -f `brew --prefix`/bin/peco ]]; then
  # Alias
  alias ghc='cd $(ghq list -p | peco)'
  alias gho='gh-open $(ghq list -p | peco)'

  ## peco-で始まるfunctionを検索する
  function peco-function-list () {
    local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep peco- | grep -v function-list | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
      ${selected}
    fi
  }
  zle -N peco-function-list
  bindkey '^k' peco-function-list

  ## pecoでghqのソースディレクトリを開く
  function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }
  zle -N peco-src
  bindkey '^]' peco-src

  ## gh-openエイリアスコマンドのショートカット設定
  function peco-gh-open () {
    gh-open $(ghq list -p | peco)
  }
  zle -N peco-gh-open
  bindkey '^g' peco-gh-open

  ## ^r でのコマンドヒストリにpecoを使う
  function peco-select-history() {
    local tac
    if which tac > /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
      eval $tac | \
      peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi


### Mac Only
# クイックルック起動
# 次のコマンドをdefaults実行するとquicklookでテキスト選択できるようになる
# defaults write com.apple.finder QLEnableTextSelection -bool true
if [ -f /usr/bin/qlmanage ]; then
  alias ql='qlmanage -p "$@" >& /dev/null'
fi

