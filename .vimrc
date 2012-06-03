"vunlde.vimで管理してるpluginを読み込む
source ~/dotfiles/.vimrc.bundle
"Color関連
source ~/dotfiles/.vimrc.colors
"補完(completion)関連
source ~/dotfiles/.vimrc.completion
"表示関連
source ~/dotfiles/.vimrc.apperance
"プラグインの設定
source ~/dotfiles/.vimrc.plugins_setting


"swap なし
set noswapfile

"チルダ（バックアッップ）ファイルなし
set nobackup

" クリップボードのコピー
set clipboard+=autoselect

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" Ctrl-i２回押しでカーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>


" ;でコマンド入力( ;と:を入れ替)
noremap ; :


" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 貼り付け時のコメントが自動で入るのを防止
autocmd FileType * set formatoptions-=ro

