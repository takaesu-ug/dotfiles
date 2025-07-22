-- plugins/init.lua - プラグイン管理（lazy.nvim）

-- lazy.nvimのインストール
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグイン定義
local plugins = {
  -- カラースキーム
  {
    'w0ng/vim-hybrid',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme hybrid')
    end,
  },

  -- 基本プラグイン
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
  },

--  -- FZF
--  {
--      'junegunn/fzf',
--      build = function()
--          vim.fn['fzf#install']()
--      end,
--  },
--  {
--      'junegunn/fzf.vim',
--      dependencies = { 'junegunn/fzf' },
--      config = function()
--          require('plugins.configs.fzf')
--      end,
--  },
--
  -- 括弧補完
  {
    'kana/vim-smartinput',
    event = 'InsertEnter',
  },

  -- 複数カーソル
  {
    'terryma/vim-multiple-cursors',
    event = 'VeryLazy',
  },

--  -- キャメルケース移動
--  {
--      'bkad/CamelCaseMotion',
--      config = function()
--          require('plugins.configs.camelcasemotion')
--      end,
--  },
--
  -- Git
  require("plugins.configs.fugitive"),

--  -- コメント
--  {
--      'tomtom/tcomment_vim',
--      config = function()
--          require('plugins.configs.tcomment')
--      end,
--  },
--
--  -- 検索置換サポート
--  { 'tpope/vim-abolish' },
--
--  -- リンター
--  {
--      'w0rp/ale',
--      event = { 'BufReadPre', 'BufNewFile' },
--      config = function()
--          require('plugins.configs.ale')
--      end,
--  },
--
--  -- LSP（COC）
--  {
--      'neoclide/coc.nvim',
--      branch = 'release',
--      event = 'VeryLazy',
--      config = function()
--          require('plugins.configs.coc')
--      end,
--  },

  -- インデントガイド
  require("plugins.configs.treesitter"),
  require("plugins.configs.indent-blankline"),
  -- カラープレビュー
  require("plugins.configs.colorizer"),
  -- ステータスライン
  require('plugins.configs.lightline'),
}

-- lazy.nvimのセットアップ
require('lazy').setup(plugins, {
  defaults = {
    lazy = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
--        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
