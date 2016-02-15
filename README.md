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

setup-homebrew-ansible.shを実行することでhomebrewとansibleをインストールする

```
% cd $HOME/dotfiles/
% ./setup-hombrew-ansible.sh
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
% cp .gitconfig.local_template .gitconfig.local
```


### github用の設定
**(これは既に.gitconfigに設定が入っているのでやる必要はない)**

- [GitHubへのアクセスはSSHよりHTTPSがお勧めらしいので切り替えてみた - Qiita](http://qiita.com/hnakamur/items/cb04882cc69f2d1a7367)
- https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-https-urls-recommended

```
git config --global credential.helper osxkeychain

# パスワードを入れる
# または２段階認証を使っている場合はアクセストークンを入れる
```

peco関連設定(homebrewでインストール済み)
-------------------

```
% mkdir $HOME/.peco
% ln -s $HOME/dotfiles/peco_config.json $HOME/.peco/config.json
```

zsh設定
--------------------
### oh-my-zsh

[robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

#### インストール

```
% curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

この時点でおそらくoh-my-zsh用の $HOME/.zshrc ができていると思うが以下のとおり別ファイル名で保管して、
自分の設定ファイルを適用する

```
% mv $HOME/.zshrc $HOME/.zshrc_bk_oh-my-zsh
% ln -s ~/dotfiles/zshdir/oh-my-zsh/zshrc $HOME/.zshrc
```

#### (別手順)手動インストール方法

手動で入れたい場合のみ実行する
https://github.com/robbyrussell/oh-my-zsh#manual-installation

```
% git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

iterm2関連の設定
-------------------

### iterm2 + macvim の環境で記号の表示が半角分しか確保されず表示がずれてしまう件の対応方法

[もぷろぐ: Mac の iTerm2 と Vim の 全角記号の問題について](http://ac-mopp.blogspot.jp/2012/10/mac-iterm2-vim.html)

.vimrcに以下の設定を入れるというのをよく見かけるが、
`set ambiwidth=double`

iterm2の場合はダメなようです。
`Preferences > Profile > Text > Double-Width Characters` の `Treat ambiguous-width characters as double width.` にチェックする

だが、、↑のitermの設定にするとtmuxでpaneを分割すると枠線が消えてしまう問題が発生する
[iTerm2 + tmux での pane の枠線の表示に関する問題を解決する - Qiita](http://qiita.com/snaka/items/0d26a73a5f0372ae95b9)


### color テーマ
vim のカラーテーマ `vim-hybrid` を利用してiterm2のカラーを変更できるのでお好みに
[w0ng/vim-hybrid](https://github.com/w0ng/vim-hybrid)

```
curl -O https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors
```

hybrid.itermcolors というファイルが出来るのitermの preferences->Profile から読み込む

## vim-hybridの設定は.vimrcに以下のような定義があること

```
  set background=dark
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1
  colorscheme hybrid
```

その他各種設定ファイルを配置
--------------------

```
% cd $HOME/dotfiles/
% ./link.sh
```


vim設定
--------------------

dotfiles/vimdir ディレクトリを ~/.vim にリンクを貼る

参考
dotfiles/vimdir/README_LINK.txt

### NeoBundleの対応
http://qiita.com/puriketu99/items/1c32d3f24cc2919203eb
以下のようにNeoBundleだけ先に入れておく。

```
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

その他はNeoBundle経由でプラグインをインストールするので vimを立ち上げてから `:NeoBundleInstall` を実行する


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

Go関連設定
--------------------

```
go get -u github.com/motemen/ghq
go get -u github.com/typester/gh-open
```


●●env 関連のプログラミングビルドツール設定
-------------------

以下のファイルを参照

dotfiles/my-docs/env.md
