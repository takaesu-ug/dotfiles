# PATH初期化
export PATH=
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

# Homebrew PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# homebrew関連で keg-only なパッケージ用
export PATH=/usr/local/opt/mysql-client/bin:$PATH

# El Capitanにしたらzsh上でのPATHが上書きされた - すぎゃーんメモ
# http://memo.sugyan.com/entry/20151211/1449833480
# /etc/zprofileなど /etc以下の設定は読まないようにする
setopt no_global_rcs


# プログラミング言語関連の設定
#   ログインシェルやインタラクティブシェル以外でも実行させたい場合はここで以下を読み込む
#   ALEなど以下のようにzshの-cオプションで実行されるみたいなのでログインシェルでの実行ではないためzshenvで読み込む必要がある
#   /usr/local/bin/zsh -c 'flake8'   (vim上で :ALEInfo で確認できる)
source ~/dotfiles/zshdir/zshrc.programming
