-- plugins/configs/tcomment.lua

-- tcomment設定
vim.g.tcomment_mapleader1 = '<C-_>'
vim.g.tcomment_opleader1 = 'gc'

-- カスタム形式定義
vim.g.tcomment_types = vim.g.tcomment_types or {}
vim.g.tcomment_types = vim.tbl_extend('force', vim.g.tcomment_types, {
  php_surround = "<?php %s ?>",
  eruby_surround = "<%% %s %%>",
  eruby_surround_minus = "<%% %s -%%>",
  eruby_surround_equality = "<%%= %s %%>",
})

-- ERuby用マッピング関数
local function set_eruby_mapping()
  vim.keymap.set('n', '<C-@>c', ':TCommentAs eruby_surround<CR>', { buffer = true })
  vim.keymap.set('n', '<C-@>-', ':TCommentAs eruby_surround_minus<CR>', { buffer = true })
  vim.keymap.set('n', '<C-@>=', ':TCommentAs eruby_surround_equality<CR>', { buffer = true })
  
  vim.keymap.set('v', '<C-@>c', ':TCommentAs eruby_surround<CR>', { buffer = true })
  vim.keymap.set('v', '<C-@>-', ':TCommentAs eruby_surround_minus<CR>', { buffer = true })
  vim.keymap.set('v', '<C-@>=', ':TCommentAs eruby_surround_equality<CR>', { buffer = true })
end

-- PHP用マッピング関数
local function set_php_mapping()
  vim.keymap.set('n', '<C-@>c', ':TCommentAs php_surround<CR>', { buffer = true })
  vim.keymap.set('v', '<C-@>c', ':TCommentAs php_surround<CR>', { buffer = true })
end

-- FileType autocmd
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'eruby',
  callback = set_eruby_mapping,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'php',
  callback = set_php_mapping,
})