-- plugins/configs/fzf.lua

-- FZF設定
vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

-- rtpにFZFパスを追加
vim.opt.rtp:append('/opt/homebrew/opt/fzf')

-- レイアウト設定
vim.g.fzf_layout = { down = '~40%' }

-- アクション設定
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- キーマッピング
vim.keymap.set('n', '<C-p><C-f>', ':FZF<CR>', { silent = true })
vim.keymap.set('n', '<C-p><C-m>', ':FZFMru<CR>', { silent = true })

-- MRU（Most Recently Used）ファイル機能
vim.cmd([[
  command! FZFMru call fzf#run(fzf#wrap({
  \ 'source':  reverse(s:all_files()),
  \ 'options': '-m -x +s',
  \ 'down':    '40%' }))

  function! s:all_files()
    return extend(
    \ filter(copy(v:oldfiles),
    \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
    \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
  endfunction
]])