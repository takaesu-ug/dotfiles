env関連の設定
============
env関連の設定

rbenv
----------

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`" rbenv install -k 2.1.2

rbenv rehash

rbenv versions

rbenv global 2.1.2

nbenv
----------

git clone https://github.com/riywo/ndenv ~/.ndenv
git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build

ndenv install v0.12.2

ndenv rehash

ndenv global v0.12.2

