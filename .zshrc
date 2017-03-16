# ルート証明を読み込む（brewでcurl-ca-bundleを入れている場合)
if [[ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

#### 以 下 自 分 用 の 設 定  ###
# promptの設定を読み込む
source ~/dotfiles/zshdir/zshrc.prompt

# 基本的な設定
source ~/dotfiles/zshdir/zshrc.basic

# プログラミング言語関連の設定
source ~/dotfiles/zshdir/zshrc.programming

# オリジナルコマンド類の読み込み
source ~/dotfiles/zshdir/zshrc.command
source ~/dotfiles/zshdir/zshrc.function

# secret environments variables (ex. access_toke)
if [[ -f ~/dotfiles/secret/set_environment.sh ]]; then
  source ~/dotfiles/secret/set_environment.sh
fi

### 最後に読み込ませたい
# direnv用の設定
eval "$(direnv hook zsh)"
