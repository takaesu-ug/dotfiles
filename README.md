yusabana's dotfiles
========

**terminal.app で実施(あとでiterm2は使う)**

- XCode Install (App Storeから)
- XCode Commandline tool インストール
  - xcode-select -install
- cd /Users/takaesu/dotfiles/provisioning
  - ./1setup_anyenv.sh
  - exec $SHELL -l
- python関連インストール(3.6系入れて、pipでpipenv, neovimを入れる)
  - pyenv install できない場合(moojaviで): https://qiita.com/zreactor/items/c3fd04417e0d61af0afe
  - pyenv install 3.8.1
  - pyenv global 3.8.1
  - pyenv rehash
  - pip install pipenv
- cd /Users/takaesu/dotfiles/provisioning
  - pipenv install --ignore-pipfile
  - pipenv run ansible-playbook -i hosts _1homebrew.yml
- Dropboxを設定
- cd /Users/takaesu/dotfiles/provisioning
  - pipenv run ansible-playbook -i hosts _2zsh.yml
  - pipenv run ansible-playbook -i hosts _3symlink.yml
  - pipenv run ansible-playbook -i hosts _4vimplug.yml
- dotfiles/iterm2 の設定を読み込む
  - https://qiita.com/reoring/items/a0f3d6186efd11c87f1b
- golang 関連のインストール
  - goenv を利用
- ruby関連インストール
  - rbenv 利用
- node関連インストール
  - ndenv 利用
- キーリピートの設定(playbookにするか…)
- iterm2関連の設定

-----------

AppStoreで入れるもの
-------------------

- quiver

xcode, xcode-commandline-toolsをインストールする
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
% cd $HOME/dotfiles/provisioning
% ./setup-hombrew-ansible.sh
```

ansibleからhomebrew, homebrew-cask関連のパッケージをインストールする

```
% cd $HOME/dotfiles/
$ ansible-playbook -i ansible_hosts -vv homebrew-packages.yml

$ pipenv run ansible-playbook -i ansible_hosts -vv homebrew-packages.yml
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

## iterm2の設定を読み込むようにする

iterm2のディレクトリを Preferences で読み込むようにする

```
~/dotfiles/iterm2/
```

### color テーマ
vim のカラーテーマ `vim-hybrid` を利用してiterm2のカラーを変更できるのでお好みに
[w0ng/vim-hybrid](https://github.com/w0ng/vim-hybrid)

```
curl -O https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors
```

hybrid.itermcolors というファイルが出来るのitermの preferences->Profile から読み込む


### 全画面表示

Preferences -> General -> `Native full screen windows` のチェックを外す

### メニューバーを常に表示

Preferences -> Appearance -> System -> `Auto-hide menu bar in non-native fullscreen` のチェックを外す

### Ambiguous charactersの設定

Preference -> Profiles -> Text `Ambiguous characters are double-width`


vim共通
----------------

dotfiles/vimdir ディレクトリを ~/.vim にリンクを貼る

```
ln -s $HOME/dotfiles/vimdir $HOME/.vim
```

参考
dotfiles/vimdir/README_LINK.txt


### vim-hybridの設定は.vimrcに以下のような定義があること

```
  set background=dark
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1
  colorscheme hybrid
```


### vim8

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

TODO:
- [最近の私的 Golang 開発環境 - Qiita](https://qiita.com/spiegel-im-spiegel/items/c140fc1fe02aa24be4fd)
  - 上記の記事の指針と同じようにして gopath は 今のように workspaces/gopath にして、 ghqはworkspaces/ghq/src にしてgo系は dep で管理する
  - んで GOPATHに workspaces/ghq/ を追加する
  - 分ける理由は GOPATH汚染 を避けるため http://text.baldanders.info/golang/gopath-pollution/

```
% go get -u github.com/motemen/ghq
% go get -u github.com/pocke/whichpr
% go get -u github.com/mattn/memo
% go get -u github.com/knqyf263/pet
% go get -u github.com/Code-Hex/pget/cmd/pget  # 高速ダウンローダー
```

XXXXenv 関連のプログラミングビルドツール設定
-------------------

以下のファイルを参照

[dotfiles/docs/env.md](https://github.com/yusabana/dotfiles/blob/master/docs/env.md)

