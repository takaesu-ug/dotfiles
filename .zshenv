
# perlbrew
if [[ -f ~/perl5/perlbrew/etc/bashrc ]]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# Graidle (groovy)
export GRADLE_HOME=/usr/local/Cellar/gradle/1.0-milestone-9
export PATH=$PATH:$GRADLE_HOME/bin

# ruby rbenv
eval "$(rbenv init -)"

