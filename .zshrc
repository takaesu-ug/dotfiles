## お す す め 設 定 を 読 み 込 む

## https://github.com/clear-code/zsh.d/
source ~/dotfiles/zsh.d/zshrc_yusabana

#### 以 下 自 分 用 の 設 定  ###
# $HOME binを読み込む
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# ルート証明を読み込む（brewでcurl-ca-bundleを入れている場合)
if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
    export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

# go用の設定
export GOPATH=~/workspace/gopath
export PATH=$GOPATH/bin:$PATH

# オリジナルコマンドの読み込み
source ~/dotfiles/.zshrc.command

## Anadroid SDK PATH
#.zlogin で設定


### 最後に読み込ませたい
# direnv用の設定
# https://github.com/zimbatm/direnv/issues/42 (DIRENV_RUBYの設定)
eval "$(direnv hook $0)"
export DIRENV_RUBY=/usr/bin/ruby
