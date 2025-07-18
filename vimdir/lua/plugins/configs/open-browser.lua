-- plugins/configs/open-browser.lua

-- URLをブラウザで開く
vim.keymap.set('n', '<Leader>o', '<Plug>(openbrowser-open)', {})
vim.keymap.set('v', '<Leader>o', '<Plug>(openbrowser-open)', {})

-- ググる
vim.keymap.set('n', '<Leader>g', ':<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>', {})