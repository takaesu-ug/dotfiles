# homebrew PATH
export PATH=/usr/local/bin:$PATH

# Graidle (groovy)
export GRADLE_HOME=/usr/local/Cellar/gradle/1.0-milestone-9
export PATH=$PATH:$GRADLE_HOME/bin


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

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
type anyenv > /dev/null 2>&1 && eval "$(anyenv init -)"
