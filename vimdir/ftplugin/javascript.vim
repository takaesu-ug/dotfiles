setlocal tabstop=2
setlocal shiftwidth=2

" http://dackdive.hateblo.jp/entry/2016/04/28/090000
" http://stackoverflow.com/a/38163633
" ローカルにあるeslintでチェックするようにする https://github.com/mtscout6/syntastic-local-eslint.vim/blob/master/ftplugin/javascript.vim
" シンタックスチェックがうざい時は、:SyntasticToggleMode でON／OFFを切り換えられる
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
