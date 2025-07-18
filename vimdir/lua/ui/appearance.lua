-- ui/appearance.lua - 表示関連設定

local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn

-- シンタックスハイライト有効化
cmd('syntax enable')

-- 表示設定
opt.showmatch = true      -- 括弧の対応をハイライト
opt.number = true         -- 行番号表示
opt.list = true           -- 不可視文字表示
opt.listchars = { nbsp = '¬', tab = '>.', trail = '_', extends = '>', precedes = '<' }
opt.display = 'uhex'      -- 印字不可能文字を16進数で表示

-- ハイライト設定
cmd([[
  highlight SpecialKey cterm=underline ctermfg=237 guibg=darkgray
  highlight LineNr ctermfg=238
  highlight PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
]])

-- ステータスライン設定（lightlineを使用）
opt.laststatus = 2

-- 全角スペースの表示
cmd([[
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
  match ZenkakuSpace /　/
]])

-- カーソルライン自動制御
local cursorline_lock = 0
local cursorline_group = vim.api.nvim_create_augroup('vimrc-auto-cursorline', { clear = true })

local function auto_cursorline(event)
  if event == 'WinEnter' then
    vim.wo.cursorline = true
    cursorline_lock = 2
  elseif event == 'WinLeave' then
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false
  elseif event == 'CursorMoved' then
    if cursorline_lock > 0 then
      if cursorline_lock > 1 then
        cursorline_lock = 1
      else
        vim.wo.cursorline = false
        vim.wo.cursorcolumn = false
        cursorline_lock = 0
      end
    end
  elseif event == 'CursorHold' then
    vim.wo.cursorline = true
    cursorline_lock = 1
  end
end

vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
  group = cursorline_group,
  callback = function() auto_cursorline('CursorMoved') end,
})

vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
  group = cursorline_group,
  callback = function() auto_cursorline('CursorHold') end,
})

vim.api.nvim_create_autocmd('WinEnter', {
  group = cursorline_group,
  callback = function() auto_cursorline('WinEnter') end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  group = cursorline_group,
  callback = function() auto_cursorline('WinLeave') end,
})

-- パフォーマンス設定
opt.lazyredraw = true     -- コマンド実行中は再描画しない
opt.ttyfast = true        -- 高速ターミナル接続

-- スクロール設定
opt.scrollbind = false    -- 分割時のスクロールを同期しない