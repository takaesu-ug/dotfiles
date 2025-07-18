-- core/options.lua - 基本オプション設定

local opt = vim.opt

-- ビープ音を消す
opt.vb = false
opt.visualbell = false
opt.errorbells = false
opt.belloff = 'all'

-- ファイル管理
opt.swapfile = false      -- swapファイルなし
opt.backup = false        -- バックアップファイルなし
opt.undofile = false      -- .{ファイル名}.un~ ファイルを作成しない
opt.backupskip = '/tmp/*,/private/tmp/*'  -- crontab編集時のtmpディレクトリでバックアップをスキップ

-- 表示設定
opt.display = 'lastline'  -- 一行の文字数が多くてもきちんと描画
opt.cmdheight = 2         -- メッセージ表示を2行

-- クリップボード設定
if vim.fn.has('nvim') == 1 then
  opt.clipboard:append('unnamedplus')
else
  opt.clipboard:append('unnamed')
end

-- カーソル移動
opt.whichwrap = 'b,s,h,l,<,>,[,]'  -- カーソルを行頭、行末で止まらないように

-- 検索設定
opt.ignorecase = true     -- 大文字小文字を区別しない
opt.smartcase = true      -- 大文字を含んでいたら区別する
opt.incsearch = true      -- インクリメンタルサーチ
opt.hlsearch = true       -- 検索時のハイライト

-- マウス操作
opt.mouse = 'a'           -- マウス操作を有効化

-- 編集設定
opt.backspace = 'indent,eol,start'  -- Backspaceキーを有効化

-- 文字幅設定
if vim.fn.exists('&ambw') == 1 then
  opt.ambw = 'double'
end

-- タブ・インデント設定（デフォルト）
opt.expandtab = true      -- タブをスペースで挿入
opt.tabstop = 4           -- タブ幅
opt.shiftwidth = 4        -- インデント幅
opt.softtabstop = 0       -- ソフトタブ幅

-- grep設定
opt.grepprg = 'ag --hidden --vimgrep $*'
opt.grepformat = '%f:%l:%m'
