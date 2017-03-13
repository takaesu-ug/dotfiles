yusabana's dotfiles
========

dot files(Setting files) Repository （設定ファイル関連のリポジトリ）

Fontをインストール
-------------

* RictyDiminished
  * https://github.com/mzyy94/RictyDiminished-for-Powerline
* Noto Sans CJK JP
  * https://www.google.com/get/noto/#sans-jpan

MacOSXの場合、xcode, xcode-commandline-toolsをインストールする
-------------------

### xcode
AppStoreでインストールする

### xcode-commandline-tools

```
% xcode-select --install
```

## キーリピートを早くする

* Karabinerは使わない https://github.com/markandrewj/Karabiner-Elements/blob/391b860aa4e4091c2617024ef2afef4da75fcefe/examples/key_repeat.md
* [Macのキーリピートをシステム設定での設定よりも速くする](http://drumsoft.com/blog/archives/21)

```
## 設定する 値を小さくしたほうが早くなる
% defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
% defaults write -g KeyRepeat -int 1         # normal minimum is 2 (30 ms)

## 設定値を確認する
% defaults read NSGlobalDomain KeyRepeat
% defaults read NSGlobalDomain InitialKeyRepeat
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

### ※特記事項

homebrew-caskで入れたアプリケーションは以下のように環境変数を設定してから再度インストールすることで上書きインストールしてアップデートができる。

```
HOMEBREW_CASK_OPTS="--appdir=/Applications" brew cask install macvim-kaoriya --force
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

```
ln -s $HOME/dotfiles/vimdir $HOME/.vim
```

参考
dotfiles/vimdir/README_LINK.txt

### dein.vimを使ってプラグインはインストールする

https://github.com/Shougo/dein.vim/blob/master/doc/dein.txt

* 設定ファイルは以下
  * vimdir/vimrc.dein

* プラグインの読み込みはtomlファイルで定義
  * vimdir/dein.toml
  * vimdir/dein_lazy.toml

vimrc.dein にて dein.vim は自動でインストールするように設定しているので特に個別に入れる必要はない
また $HOME/.cache/dein/ 以下にプラグインのモジュールなどはインストールされる

```
インストールする
:call dein#install()

アップデートする
:call dein#update()

deinで入れているプラグイン一覧
:Unite dein
```

* [NeoVim、そしてdein.vimへ - Qiita](http://qiita.com/okamos/items/2259d5c770d51b88d75b)
* [NeoBundle から dein.vim に乗り換えたら爆速だった話 - Qiita](http://qiita.com/delphinus35/items/00ff2c0ba972c6e41542)
* [NeoVim と dein.vim を使ってみる! - Qiita](http://qiita.com/ress/items/7e71e007cf8d41a07a1a)

Go関連設定
--------------------

### ただバイナリを利用するだけならghgでインストールする。

```
go get -u github.com/Songmu/ghg/cmd/ghg
```

* 必要なパッケージをインストール

```
ghg get motemen/ghq
ghg get typester/gh-open
ghg get peco/peco
ghg get mattn/memo
```

* ghgのインストールディレクトリにパスを通す

```
if type ghg >/dev/null 2>&1; then
  export PATH=$PATH:$(ghg bin)
fi
```

peco関連設定(homebrewでインストール済み)
-------------------

```
% mkdir $HOME/.peco
% ln -s $HOME/dotfiles/peco_config.json $HOME/.peco/config.json
```

XXenv 関連のプログラミングビルドツール設定
-------------------

以下のファイルを参照

[dotfiles/my-docs/env.md](https://github.com/yusabana/dotfiles/blob/master/my-docs/env.md)
