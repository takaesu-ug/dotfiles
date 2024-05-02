# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# 設定ファイルの読み込み順
# https://qiita.com/muran001/items/7b104d33f5ea3f75353f
# 1. global) /etc/zshenv
# 2. local ) ~/.zshenv
# 3. global) /etc/zprofile
# 4. local ) ~/.zprofile
# 5. global) /etc/zshrc
# 6. local ) ~/.zshrc
# 7. global) /etc/zlogin
# 8. local ) ~/.zlogin

# ルート証明を読み込む（brewでcurl-ca-bundleを入れている場合)
if [[ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

# 基本的な設定
source ~/dotfiles/zshdir/zshrc.basic

# オリジナルコマンド類の読み込み
source ~/dotfiles/zshdir/zshrc.command
source ~/dotfiles/zshdir/zshrc.function

source ~/dotfiles/zshdir/zshrc.zplugin

# secret environments variables (ex. access_token)
if [[ -f ~/dotfiles/secret/set_environment.sh ]]; then
  source ~/dotfiles/secret/set_environment.sh
fi

### 最後に読み込ませたい
# direnv用の設定
eval "$(direnv hook zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
