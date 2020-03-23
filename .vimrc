scriptencoding utf-8
set encoding=utf-8

" filetypeの設定を記述
source $HOME/dotfiles/vimdir/vimrc.filetype

" vim-plug
source $HOME/dotfiles/vimdir/vimrc.plug

" Color
source $HOME/dotfiles/vimdir/vimrc.colors

" 表示関連
source $HOME/dotfiles/vimdir/vimrc.apperance

" プラグインの設定
source $HOME/dotfiles/vimdir/vimrc.plugins_setting

" 基本的な設定関連
source $HOME/dotfiles/vimdir/vimrc.basic

" プログラミング関連設定
source $HOME/dotfiles/vimdir/vimrc.programming

" 補完(completion)関連
source $HOME/dotfiles/vimdir/vimrc.completion
" deoplete関連の設定
source $HOME/dotfiles/vimdir/vimrc.deoplete

filetype on
filetype plugin indent on
