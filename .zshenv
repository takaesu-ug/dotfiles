# Graidle (groovy)
export GRADLE_HOME=/usr/local/Cellar/gradle/1.0-milestone-9
export PATH=$PATH:$GRADLE_HOME/bin

# Anadroid SDK PATH
export PATH=$PATH:$HOME/workspace/android-sdk/tools:$HOME/workspace/android-sdk/platform-tools

# go用の設定
export GOPATH=~/workspace/gopath
export PATH=$GOPATH/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# homebrew PATH
export PATH=/usr/local/bin:$PATH

## anyenv
# http://qiita.com/luckypool/items/f1e756e9d3e9786ad9ea
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"

  ## tmuxを使った場合にパスの読み込みを正しくする
  for D in `ls $HOME/.anyenv/envs`; do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# # perlbrew
# if [[ -f ~/perl5/perlbrew/etc/bashrc ]]; then
#   source ~/perl5/perlbrew/etc/bashrc
# fi
#
# # nodebrew
# if [[ -f ~/.nodebrew/nodebrew ]]; then
#   export PATH=$HOME/.nodebrew/current/bin:$PATH
# fi
#
# # rbenv
# (rbenvコマンドが存在する場合のみ http://qiita.com/skkzsh/items/d63861293fd6bde1b0d8)
#export PATH=$HOME/.rbenv/bin:$PATH
# type rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"
