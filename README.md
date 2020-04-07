セットアップ
======

AppStoreでインストールする
------

- quiver
- xcode

### xcode-commandline-toolsをインストールする

```
% xcode-select --install
```


Provisonning
------

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

### golang関連

```
% go get -u github.com/motemen/ghq
% go get -u github.com/pocke/whichpr
% go get -u github.com/mattn/memo
% go get -u github.com/Code-Hex/pget/cmd/pget  # 高速ダウンローダー
```

### Iterm2関連の設定

- iterm2のディレクトリを Preferences で読み込む

```
~/dotfiles/iterm2/
```

- `hybrid.itermcolors` というファイルを `preferences->Profile` から読み込む
- `Preferences` -> `General` -> `Window` -> `Native full screen windows` のチェックを外す
- `Preferences` -> `Appearance` -> `General` -> `Auto-hide menu bar in non-native fullscreen` のチェックを外す
- `Preference` -> `Profiles` -> `Text` -> `Ambiguous characters are double-width`


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


