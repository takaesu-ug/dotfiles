env関連の設定
============

anyenv
----------

```
% git clone https://github.com/riywo/anyenv ~/.anyenv
```

### anyenvのプラグインインストール

```
$ mkdir -p $(anyenv root)/plugins
$ git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

$ echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.your_profile
$ echo 'eval "$(anyenv init -)"' >> ~/.your_profile
$ exec $SHELL -l

## 以下のコマンドで各種envのアップデートができる
% anyenv update
```

```
% mkdir -p $(anyenv root)/plugins
% git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git

## 以下のようなコマンドで各env環境のgitを一括実行
% anyenv git pull
% anyenv git status
```


### 各種env関連ツールをインストール

```
# shellで再ログインする

% anyenv install ndenv
% anyenv install rbenv
% anyenv install pyenv
% anyenv install goenv

# shellで再ログインする
```




rbenv
----------

* `git clone https://github.com/sstephenson/rbenv.git ~/.rbenv`
* `git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`

```
RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`" rbenv install -k 2.4.2

rbenv rehash
rbenv versions
rbenv global 2.4.2
```

設定ファイルに以下の読み込みを追加

```
if [ -d ${HOME}/.rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  type rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"
fi
```



ndenv
----------

* `git clone https://github.com/riywo/ndenv ~/.ndenv`
* `git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build`

```
ndenv install v0.12.2
ndenv rehash
ndenv global v0.12.2
```

設定ファイルに以下の読み込みを追加

```
if [ -d ${HOME}/.ndenv ]; then
  export PATH=$HOME/.ndenv/bin:$PATH
  type ndenv > /dev/null 2>&1 && eval "$(ndenv init -)"
fi
```

pipenv
---------

- Docs
    - http://pipenv-ja.readthedocs.io/ja/translate-ja/
    - http://pipenv-ja.readthedocs.io/ja/translate-ja/#pipenv-usage


```
pip install pipenv
```

### トラブルシューティング

lang関連の問題があるようで `LC_ALL` と `LANG` を設定
https://github.com/kennethreitz/pipenv/issues/187

### コマンド

```
$ pipenv --three
$ pipenv --two

$ pipenv install [package]
$ pipenv install --dev [package]
$ pipenv install requests==2.13.0

pipenvでインストールしている状態で実行する
$ pipenv run python main.py

virtualenvでactivateしたい人のためのコマンド
$ pipenv shell
```

