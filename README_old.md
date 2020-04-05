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
- iterm2関連の設定

-----------


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



zsh設定
--------------------

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



XXXXenv 関連のプログラミングビルドツール設定
-------------------

以下のファイルを参照

[dotfiles/docs/env.md](https://github.com/yusabana/dotfiles/blob/master/docs/env.md)

