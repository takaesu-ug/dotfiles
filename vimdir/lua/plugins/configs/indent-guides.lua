-- plugins/configs/indent-guides.lua

-- indent-guides設定
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_auto_colors = 0
vim.g.indent_guides_enable_on_vim_startup = 0
vim.g.indent_guides_color_change_percent = 20
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_space_guides = 1

-- ハイライト設定
vim.cmd([[
  hi IndentGuidesOdd  ctermbg=235
  hi IndentGuidesEven ctermbg=237
]])

-- デフォルトで有効にするファイルタイプ
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'javascript', 'yaml', 'python'},
  command = 'IndentGuidesEnable',
})

-- トグルキーマッピング
vim.keymap.set('n', '<Leader>ig', '<Plug>IndentGuidesToggle', { silent = true })