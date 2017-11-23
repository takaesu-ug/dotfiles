# PATH初期化
export PATH=
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

# Homebrew PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# El Capitanにしたらzsh上でのPATHが上書きされた - すぎゃーんメモ
# http://memo.sugyan.com/entry/20151211/1449833480
# /etc/zprofileなど /etc以下の設定は読まないようにする
setopt no_global_rcs

# ログインシェルやインタラクティブシェル以外でも実行させたい場合はここで以下を読み込む
# # プログラミング言語関連の設定
# source ~/dotfiles/zshdir/zshrc.programming
