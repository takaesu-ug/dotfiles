-- core/autocommands.lua - 自動コマンド設定

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 貼り付け時のコメントが自動で入るのを防止
autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- grep検索の実行後にQuickFix Listを表示する
autocmd('QuickFixCmdPost', {
  pattern = '*grep*',
  command = 'cwindow',
})

-- カーソル形状の変更設定
if vim.fn.has('vim_starting') == 1 then
  -- 挿入モード時に非点滅の縦棒タイプのカーソル
  vim.cmd('let &t_SI .= "\\e[6 q"')
  -- ノーマルモード時に非点滅のブロックタイプのカーソル
  vim.cmd('let &t_EI .= "\\e[2 q"')
  -- 置換モード時に非点滅の下線タイプのカーソル
  vim.cmd('let &t_SR .= "\\e[4 q"')
end