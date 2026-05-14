- xcodeインストール


- homebrew をinstall
https://brew.sh/ja/

.zprofileに以下を入れる
eval "$(/opt/homebrew/bin/brew shellenv)"

- mise入れる
brew install mise

- karabiner-elements入れる
brew install --cask karabiner-elements
ln -s ~/dotfiles/.config/karabiner ~/.config/karabiner

- kittyインストール
brew install --cask kitty

zshの設定
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"


symlink設定
zsh関連のlink設定
_3symlinkの設定



各種ツールインストール
brew bundle --no-upgrade

mise install
