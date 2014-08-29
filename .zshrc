## https://github.com/clear-code/zsh.d/
source ~/dotfiles/zsh.d/zshrc_yusabana


# ルート証明を読み込む（brewでcurl-ca-bundleを入れている場合)
if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

#### 以 下 自 分 用 の 設 定  ###
# homebrew PATH
# $HOME binを読み込む
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# 基本的な設定
source ~/dotfiles/zshrc.basic

# オリジナルコマンド類の読み込み
source ~/dotfiles/.zshrc.command
source ~/dotfiles/zshrc.function


### 最後に読み込ませたい
# direnv用の設定
eval "$(direnv hook zsh)"
