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

* [Macのキーリピートをシステム設定での設定よりも速くする](http://drumsoft.com/blog/archives/21)

```
## 設定する 値を小さくしたほうが早くなる
defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2         # normal minimum is 2 (30 ms)

## 設定値を確認する
defaults read NSGlobalDomain InitialKeyRepeat
defaults read NSGlobalDomain KeyRepeat
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
----------------

dotfiles/vimdir ディレクトリを ~/.vim にリンクを貼る

```
ln -s $HOME/dotfiles/vimdir $HOME/.vim
```

参考
dotfiles/vimdir/README_LINK.txt

### vim-plug

パッケージ管理は vim-plug を使う

- [junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)
- [NeoBundle から vim-plug に乗り換えてみた - Qiita](http://qiita.com/jiminko/items/f4b337ab41db751388f7)
- [NeoBundleからvim-plugへ - Qiita](http://qiita.com/park-jh/items/226fdc6c6ea7a7598616)

```
インストール
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
:PlugStatus
:PlugInstall
:PlugUpdate
```

### neovim

設定ファイルのシンボリックリンクを貼る

```
% ln -sFi $HOME/dotfiles/vimdir $HOME/.config/nvim
```

#### neovimでvim-plugを使う

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### deoplete.nvimを使うために

https://github.com/Shougo/deoplete.nvim#requirements

```
pip2 install neovim
pip3 install neovim
```


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
ghg get knqyf263/pet
ghg get pocke/whichpr
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

XXXXenv 関連のプログラミングビルドツール設定
-------------------

以下のファイルを参照

[dotfiles/my-docs/env.md](https://github.com/yusabana/dotfiles/blob/master/my-docs/env.md)


Karabiner-Elementsの設定
-------------

```
% ln -s $HOME/dotfiles/.config/karabiner/assets $HOME/.config/karabiner/
% ln -s $HOME/dotfiles/.config/karabiner/karabiner.json $HOME/.config/karabiner/
```
