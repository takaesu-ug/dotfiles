
# perlbrew
if [[ -f ~/perl5/perlbrew/etc/bashrc ]]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# Graidle (groovy)
export GRADLE_HOME=/usr/local/Cellar/gradle/1.0-milestone-9
export PATH=$PATH:$GRADLE_HOME/bin

# ruby rbenv 
# (rbenvコマンドが存在する場合のみ http://qiita.com/skkzsh/items/d63861293fd6bde1b0d8)
type rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"


export PATH=/usr/local/bin:$PATH
