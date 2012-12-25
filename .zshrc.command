### Alias類
# find grep 合わせ技のエイリアス まだできていない・・・・・
# grep （数字分上下を表示[-B数字 -A数字]  再帰的[-r]）
alias grep="grep --color"

# インストールしたCpanモジュールを出力
alias pm-installed="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print"
alias pm-version='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"$module\::VERSION"} || "not found" }'"'"


# w3mでgoogle検索
function google() {
local str opt
if [ $ != 0 ]; then
    for i in $*; do
        str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

# w3mでALC検索
function alc() {
if [ $ != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
    w3m "http://www.alc.co.jp/"
fi
}

# tmux init
## tmuxのカラー設定　itermでtmuxを使い、Vimのカラースキームを有効にする
## http://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode
alias tmux="TERM=screen-256color-bce tmux"
function tmux_init() {
  SESS='takamax'
  if [ $# -eq 1 ]; then
    SESS=$1
  fi

  tmux -f ~/.tmux.conf new-session -d -s $SESS
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:1 -n dev
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:2 -n db
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:3 -n search
  tmux -f ~/.tmux.conf new-window -d -k -t $SESS:4 -n run
  tmux -f ~/.tmux.conf attach-session -t $SESS
}

# kayac 情報
function kayac() {
echo "┌"
echo "└+++┘ 面白法人KAYAC (KAYAC Inc.) ～～-----------～～~~~~～～---------"
echo "【電話番号】"
echo "  鎌倉本社:\t(TEL)0467-61-3399\t(FAX)0467-61-3398"
echo "  恵比寿支社:\t(TEL)03-5489-3399\t(FAX)03-5489-8821"
echo "  下馬支社:\t(TEL)0467-61-3388"
echo "  京都支社:\t(TEL)075-741-7997\t(FAX)075-741-7998"
echo "  鎌倉駅前支社:\t(TEL)0467-61-3393\t(FAX)0467-61-3392"
echo "【住所】"
echo "  鎌倉本社    : 〒248-0006 神奈川県鎌倉市小町2-14-7 かまくら春秋スクエア2階"
echo "  恵比寿支社  : 〒150-0021 渋谷区恵比寿西1-16-15 EBISU WEST 3F"
echo "  下馬支社    : 〒248-0006 神奈川県鎌倉市小町2-14-10 鎌倉メディカルサプライビル4F "
echo "  京都支社    : 〒600-8411 京都府京都市下京区烏丸通四条下ル水銀屋町620 COCON KARASUMA　806"
echo "  鎌倉駅前支社 : 〒248-0006 神奈川県鎌倉市小町1-4-1 御代川ビル4F"
echo "【設立】"
#    echo "  1998年8月3日 経過年数->"`php -r "echo ((mktime(0,0,0,date('m'),date('d'),date('Y')) - mktime(0,0,0,8,3,1998)) / (60*60*24)) / 365;"`"年"
birthDate=902070000
nowDate=`date "+%s"`
diff=`expr $nowDate - $birthDate`
year=`expr 60 \* 60 \* 24 \* 365`
echo "  1998年8月3日 経過年数->"`echo "scale=2; $diff / $year" | bc`"年"
echo "【2012年カヤックの全社テーマ】"
echo " 「面白く働く」"
echo " 「わかりやすいものをつくる」"
echo " 「仕組化を連呼する」"
}


