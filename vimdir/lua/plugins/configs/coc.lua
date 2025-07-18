-- plugins/configs/coc.lua

-- グローバル拡張機能
vim.g.coc_global_extensions = {
  'coc-marketplace',
  'coc-snippets',
  'coc-pairs',
  'coc-lists',
  'coc-json',
  'coc-html',
  'coc-emmet',
  'coc-css',
  'coc-tsserver',
  'coc-solargraph',
  'coc-styled-components',
  'coc-yaml',
  'coc-go',
}

-- 補完設定
local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- TABで補完候補を選択
vim.keymap.set('i', '<TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  elseif check_back_space() then
    return '<TAB>'
  else
    return vim.fn['coc#refresh']()
  end
end, { expr = true, silent = true })

-- Shift-TABで前の候補を選択
vim.keymap.set('i', '<S-TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  else
    return '<C-h>'
  end
end, { expr = true })

-- Ctrl-Kで補完をトリガー
vim.keymap.set('i', '<c-k>', 'coc#refresh()', { expr = true, silent = true })

-- GoTo code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- フォーマット
vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)', {})
vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)', {})

-- リネーム
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- CoCListコマンド
vim.keymap.set('n', '<space>a', ':<C-u>CocList diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<space>e', ':<C-u>CocList extensions<cr>', { silent = true })
vim.keymap.set('n', '<space>c', ':<C-u>CocList commands<cr>', { silent = true })
vim.keymap.set('n', '<space>o', ':<C-u>CocList outline<cr>', { silent = true })
vim.keymap.set('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { silent = true })
vim.keymap.set('n', '<space>f', ':<C-u>CocList files<cr>', { silent = true })
vim.keymap.set('n', '<space>m', ':<C-u>CocList mru<cr>', { silent = true })
vim.keymap.set('n', '<space>p', ':<C-u>CocListResume<CR>', { silent = true })

-- カーソルハイライト
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end,
})

-- ステータスライン
vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

-- スニペット設定
vim.g.coc_snippet_next = '<c-n>'
vim.g.coc_snippet_prev = '<c-p>'

-- カスタムコマンド
vim.api.nvim_create_user_command('Format', function()
  vim.fn.CocAction('format')
end, {})

vim.api.nvim_create_user_command('Prettier', function()
  vim.cmd('CocCommand prettier.formatFile')
end, {})