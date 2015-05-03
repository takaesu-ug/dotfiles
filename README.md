yusabana's dotfiles
========

dot files(Setting files) Repository （設定ファイル関連のリポジトリ）


ansibleでhomebrew関連を入れる
-------------------

homebrewインストール

`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

homebrew で python と ansible をインストール

`ansible-host` というファイルを作成する

```ansible-host
localhost
```

ansibleを実行

```
ansible-playbook -i ansible-host -vv homebrew-packages.yml
```

vim設定
--------------------

vimdir/README_LINK.txt

~/.vim ディレクトリを dotfiles/vimdir にリンクを貼る

### NeoBundleの対応
http://qiita.com/puriketu99/items/1c32d3f24cc2919203eb
以下のようにNeoBundleだけ先に入れておいて `NeoBundleInstall` を実行する

```
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

### Rsenseの設定について

- [VimでRSenseを導入 - Labo Memo](http://alice345.hatenablog.com/entry/2014/01/03/130053)
- [Vim - rsense - Qiita](http://qiita.com/kickstart123/items/afa1af3b05ee5949990f)
- [rsense omni completion "'omnifunc' は設定されていません" · Issue #355 · Shougo/neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim/issues/355)

```
brew でRsenseを入れる

% vi .vimrc
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec/"
let g:rsenseUseOmniFunc = 1
let g:neocomplcache#sources#rsense#home_directory = '/usr/local/Cellar/rsense/0.3/libexec/'
```

zsh設定
--------------------

以下を見る
zshdir/oh-my-zsh/README.md


Go関連設定
--------------------

```
go get -u github.com/motemen/ghq
go get -u github.com/typester/gh-open
```

