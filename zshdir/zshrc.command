### Alias類
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias x="exit"
alias tree="tree -F -C --dirsfirst"
alias relogin='exec $SHELL -l'

# http://qiita.com/yusabana/items/b5cc2a706be8c031043e
LESS=-qR # ビープ音を消して、ANSIカラーシーケンス

alias vi='nvim'
alias nvi='nvim'

# alias b='hub browse $(ghq list | fzf | cut -d "/" -f 2,3)'
# シングルコートのエスケープは '\'' とする必要がある。（イメージ \' とやっている感じ）
#   [.bashrcにエイリアス書くときのシングルクオート対策（source ~/.bashrc エラー対処）](http://min117.hatenablog.com/entry/2015/11/07/152302)
alias b='open $(ghq list |fzf | awk -F "/" '\''{printf("https://%s/%s/%s", $(NF-2), $(NF-1), $(NF))}'\'')'
alias v='cd $(ghq root)/$(ghq list | fzf); vi .'
alias vc='code $(ghq root)/$(ghq list | fzf)'

# Ruby のctag用
alias rtags='ctags -R -a --sort=yes --exclude="*.js" --exclude="*.h" --exclude=log --exclude="*.yml" --exclude=".git"'

# grep （数字分上下を表示[-B数字 -A数字]  再帰的[-r]）
alias grep="grep --color"

# 検索コマンドの結果をlessにパイプ カラー表示とlessを閉じても画面に残す設定
alias ag="ag -S --pager='less -R --no-init --quit-if-one-screen'"

# diffコマンドをカラーにする
alias diff="colordiff"

# SVN関連
alias svn-vim-diff='svn diff "$@" |vim -R -'

# インストールしたCpanモジュールを出力
alias pm-installed="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print"
alias pm-version='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"

### Mac Only
# クイックルック起動
# 次のコマンドをdefaults実行するとquicklookでテキスト選択できるようになる
# defaults write com.apple.finder QLEnableTextSelection -bool true
if [ -f /usr/bin/qlmanage ]; then
  alias ql='qlmanage -p "$@" >& /dev/null'
fi

# chromeコマンドでヘッドレスブラウザ利用
# https://developers.google.com/web/updates/2017/04/headless-chrome?hl=ja
if [ -f /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ]; then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  # chrome --headless --disable-gpu --dump-dom https://www.chromestatus.com
fi
