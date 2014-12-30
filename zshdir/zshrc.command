### Alias類
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias x="exit"
alias relogin='exec $SHELL -l'
alias less='less -q' # ビープ音を消す

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

### Mac Only
# クイックルック起動
# 次のコマンドをdefaults実行するとquicklookでテキスト選択できるようになる
# defaults write com.apple.finder QLEnableTextSelection -bool true
if [ -f /usr/bin/qlmanage ]; then
  alias ql='qlmanage -p "$@" >& /dev/null'
fi
