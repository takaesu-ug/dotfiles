yusabana's dotfiles
========

dot files(Setting files) Repository （設定ファイル関連のリポジトリ）

MacOSXの場合、xcode, xcode-commandline-toolsをインストールする
-------------------

### xcode
AppStoreでインストールする

### xcode-commandline-tools

```
% xcode-select --install
```

dotfiles clone する
------------------

```
% cd $HOME
% git clone https://github.com/yusabana/dotfiles
```

homebrewとpython,ansibleをインストールする
-------------------
- [Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
- [AnsibleでHomebrew, Cask, Atomエディターのパッケージを管理する - Qiita](http://qiita.com/hnakamur/items/1c27cf0df19fe57ec624)

```
% cd $HOME/dotfiles/
% ./setup1.sh
```


ansibleからhomebrew, homebrew-cask関連のパッケージをインストールする

```
% cd $HOME/dotfiles/
$ ansible-playbook -i ansible_hosts -vv homebrew-packages.yml
```

git関連設定
-------------------

```
% cd $HOME/dotfiles/
% cp .gitconfig.local.
```

iterm関連の設定
-------------------

### iterm2 + macvim の環境で記号の表示が半角分しか確保されず表示がずれてしまう件の対応方法

[もぷろぐ: Mac の iTerm2 と Vim の 全角記号の問題について](http://ac-mopp.blogspot.jp/2012/10/mac-iterm2-vim.html)

.vimrcに以下の設定を入れるというのをよく見かけるが、
`set ambiwidth=double`

iterm2の場合はそれだけではダメなようです。
`Preferences > Profile > Text > Double-Width Characters` の `Treat ambiguous-width characters as double width.` にチェックする
とりあえずiterm2を使っているときはiterm2だけの設定でことは足りていた。



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

