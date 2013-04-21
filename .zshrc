## お す す め 設 定 を 読 み 込 む

## https://github.com/clear-code/zsh.d/
source ~/dotfiles/zsh.d/zshrc_yusabana

#### 以 下 自 分 用 の 設 定  ###
# $HOME binを読み込む
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# RubyのBundler用にPathを設定
export PATH=./vendor/bin:$PATH

# オリジナルコマンドの読み込み
source ~/dotfiles/.zshrc.command

## Anadroid SDK PATH
#.zlogin で設定


