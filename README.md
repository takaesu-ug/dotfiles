セットアップ
======

AppStoreでインストールする
------

- quiver
- xcode
- tot(メモアプリ)

### xcode-commandline-toolsをインストールする

```
% xcode-select --install
```


Provisioning
------

TODO: 
    asdf というのを試してみたい
    https://asdf-vm.com/


### anyenv関連のインストール

```
% cd provisioning/
% sh ./1setup_anyenv.sh
```

### python関連のインストール(python,ansible等)

- python3.8の最新を入れる
- pythonの実行環境はpipenvで構築する

```
% pyenv install 3.8.1
% pyenv global 3.8.1
% pyenv rehash
% pip install pipenv
```

### ansibleを実行してセットアップ

- pipenvの環境を作るため、Pipfile関連をインストールする

```
% cd provisioning/
% pipenv install --ignore-pipfile
```

```
% pipenv run ansible-playbook -i hosts _1homebrew.yml

# 上記で各種ツールがインストールされる
# 必要に応じてインストールしたアプリの設定を行う
# 特にDropboxセットアップする

% pipenv run ansible-playbook -i hosts _2zsh.yml
% pipenv run ansible-playbook -i hosts _3symlink.yml
% pipenv run ansible-playbook -i hosts _4vimplug.yml
```

### Brew bundleでの各種ソフトウェアのインストール

```bash
brew bundle

# 更新はしたくない場合
brew bundle --no-upgrade
```

### golang関連

```
% go get -u github.com/mattn/memo
% go get -u github.com/Code-Hex/pget/cmd/pget # 高速ダウンローダー
```

### Iterm2関連の設定

- iterm2のディレクトリを Preferences で読み込む
- 読み込んじゃえば以下の設定は特に何もしなくていいかも

```
~/dotfiles/iterm2/
```

- `hybrid.itermcolors` というファイルを `preferences->Profile` から読み込む
- `Preferences` -> `General` -> `Window` -> `Native full screen windows` のチェックを外す
- `Preferences` -> `Appearance` -> `General` -> `Auto-hide menu bar in non-native fullscreen` のチェックを外す
- `Preference` -> `Profiles` -> `Text` -> `Ambiguous characters are double-width` のチェックを入れない
- `Preference` -> `Profiles` -> `Text` -> Font `JetBrains Mono` , Non-ASCII Font `Ricty` を設定する
- `General` -> `Selection` -> `Applications in terminal may access clipboard` を設定する


Others
------

## キーリピートを早くする

```
設定値を確認する
% defaults read NSGlobalDomain InitialKeyRepeat
% defaults read NSGlobalDomain KeyRepeat

設定する値を小さくしたほうが早くなる
% defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
% defaults write -g KeyRepeat -int 2         # normal minimum is 2 (30 ms)
```
