-- init.lua - Neovim configuration entry point
-- エンコーディング設定
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

-- ファイルタイプの無効化（設定読み込み前）
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')

-- コアモジュールの読み込み
require('core')

-- UIモジュールの読み込み
require('ui')

-- -- プラグインの読み込み
-- require('plugins')

-- ファイルタイプの有効化（設定読み込み後）
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

-- Neovim固有の設定
-- https://hori-ryota.com/blog/neovim-fix-input-broken-ttimeout/
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 30
