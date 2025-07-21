-- core/keymaps.lua - キーマッピング設定

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Ctrl-iでヘルプ
keymap('n', '<C-i>', ':<C-u>help<Space>', { noremap = true })
-- Ctrl-i２回押しでカーソル下のキーワードをヘルプでひく
keymap('n', '<C-i><C-i>', ':<C-u>help<Space><C-r><C-w><Enter>', { noremap = true })

-- ;でコマンド入力( ;と:を入れ替)
keymap('n', ';', ':', { noremap = true })

-- Oキーでノーマルモードで改行を入れる
keymap('n', 'O', ":<C-u>call append(expand('.'), '')<Cr>j", opts)

-- CTRL-hjklでウィンドウ移動
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-h>', '<C-w>h', opts)

-- 挿入モードでのカーソル移動(Emacs風)
keymap('i', '<C-n>', '<Down>', opts)
keymap('i', '<C-p>', '<Up>', opts)
keymap('i', '<C-b>', '<Left>', opts)
keymap('i', '<C-f>', '<Right>', opts)
keymap('i', '<C-a>', '<Esc>0<Insert>', { silent = true })
keymap('i', '<C-e><C-e>', '<Esc>$a', { silent = true })

-- カーソル前の文字削除
keymap('i', '<C-h>', '<C-g>u<C-h>', { silent = true })
-- カーソル後の文字削除
keymap('i', '<C-d>', '<Del>', { silent = true })
-- カーソルから行末まで削除
keymap('i', '<C-d>0', '<Esc>lc$', { silent = true })

-- 行頭・行末移動方向をキーの相対位置にあわせる
keymap('n', '0', '$', opts)
keymap('n', '1', '0', opts)

-- Escの２回押しで検索のハイライト消去
keymap('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', opts)

-- カスタムコマンド
vim.cmd([[
  :command! Tailw :%s/\s\+$//ge
  :command! Tab2w :%s/\t/  /ge
]])
