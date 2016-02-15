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

設定ファイルに以下の読み込みを追加

```
if [ -d ${HOME}/.rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  type rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"
fi
```

nbenv
----------

git clone https://github.com/riywo/ndenv ~/.ndenv
git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build

ndenv install v0.12.2
ndenv rehash
ndenv global v0.12.2

設定ファイルに以下の読み込みを追加
```
if [ -d ${HOME}/.ndenv ]; then
  export PATH=$HOME/.ndenv/bin:$PATH
  type ndenv > /dev/null 2>&1 && eval "$(ndenv init -)"
fi
```

phpenv
----------


- [phpenvの導入して複数バージョンのPHPを管理する - Qiita](http://qiita.com/uchiko/items/5f1843d3d848de619fdf) <=これがだいぶ参考になる
- [CHH/phpenv](https://github.com/CHH/phpenv)

```
インストール（~/.phpenv いかにインストールされる)
$ curl -L https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | sh

php−buildインストール
$ git clone git://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build

phpenvとphp-buildのアップデート方法
$ UPDATE=yes phpenv-install.sh
```

```phpのbuildオプションは以下にある
# デフォルトのオプション
$HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options


# 各バージョンごとの設定
$HOME/.phpenv/plugins/php-build/share/php-build/definitions/5.5.12

各バージョンごとのファイルに以下の設定を入れるとbuildオプションを設定できる。（設定ファイルの一番上に入れる）
# オプションを追加する
configure_option "--enable-pcntl"
# オプションを外す
configure_option -D "--with-mysqli"

```

### php5.3.29  を入れるときにエラーが出たので、以下の設定を入れてみた

- [php-buildでcli版をビルドした時にエラーが出た - ./ringo](http://ringogirl.hatenablog.jp/entry/2013/02/08/111329)
- [phpenv と php-build で PHP をインストールして管理 〜 CentOS6 | EasyRamble](http://easyramble.com/install-php-with-phpenv.html)

```
% phpenv install 5.3.29
[Info]: Loaded extension plugin
[Info]: Loaded apc Plugin.
[Info]: Loaded composer Plugin.
[Info]: Loaded pyrus Plugin.
[Info]: Loaded uprofiler Plugin.
[Info]: Loaded xdebug Plugin.
[Info]: Loaded xhprof Plugin.
[Info]: php.ini-production gets used as php.ini
[Info]: Building 5.3.29 into /Users/takaesu/.phpenv/versions/5.3.29
[Skipping]: Already downloaded and extracted http://php.net/distributions/php-5.3.29.tar.bz2
[Preparing]: /var/tmp/php-build/source/5.3.29

-----------------
|  BUILD ERROR  |
-----------------

Here are the last 10 lines from the log:

-----------------------------------------
configure: warning: You will need re2c 0.13.4 or later if you want to regenerate PHP parsers.
configure: error:
+--------------------------------------------------------------------+
|                        *** ATTENTION ***                           |
|                                                                    |
| You've configured multiple SAPIs to be build. You can build only   |
| one SAPI module and CLI binary at the same time.                   |
+--------------------------------------------------------------------+
-----------------------------------------

The full Log is available at '/tmp/php-build.5.3.29.20150322122102.log'.
[Warn]: Aborting build.
phpenv install 5.3.29  1.70s user 1.64s system 78% cpu 4.240 total
```

apacheと連動するためにconfigure_optionを設定する

```$HOME/.phpenv/plugins/php-build/share/php-build/definitions/5.3.29
configure_option "--with-apxs2" "/usr/local/bin/apxs"
configure_option "--disable-fpm"
… 省略
```

これでもPHP5.3関連はインストールできなかった。。
さらに以下を参照する

- [brew 使っている環境で phpenv, php-buildがコケたメモ - Qiita](http://qiita.com/hokutoasari/items/734dce029373ff92fdce)
- http://easyramble.com/install-php-with-phpenv.html
- [phpenvが動かないのなら作りなおせばいいじゃない - Qiita](http://qiita.com/laprasDrum/items/ac367608ddd77d27d432)

```libpngの問題なので--universalオプションでインストールし直す
$ brew reinstall libpng --universal
```

```
$ phpenv install 5.3.29
```
