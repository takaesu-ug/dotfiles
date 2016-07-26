## 以下の２通りのやり方がある

## 1つ目
* ~/.vim  ディレクトリを作成する。各ディレクトリを$HOMEの.vim以下にリンクを設定する
% ln -s ../dotfiles/vimdir/dict ~/.vim
% ln -s ../dotfiles/vimdir/doc ~/.vim
% ln -s ../dotfiles/vimdir/ftplugin ~/.vim
% ln -s ../dotfiles/vimdir/snippets ~/.vim

## 2つ目
ln -s $HOME/dotfiles/vimdir $HOME/.vim


2つ目のやり方で行う
