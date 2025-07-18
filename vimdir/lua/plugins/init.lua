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
  { 'tpope/vim-surround' },
  { 'h1mesuke/vim-alignta' },
  {
    'rhysd/accelerated-jk',
    config = function()
      require('plugins.configs.accelerated-jk')
    end,
  },
  { 'tpope/vim-endwise' },

  -- FZF
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    config = function()
      require('plugins.configs.fzf')
    end,
  },

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

  -- キャメルケース移動
  {
    'bkad/CamelCaseMotion',
    config = function()
      require('plugins.configs.camelcasemotion')
    end,
  },

  -- Git
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
  },

  -- ブラウザ連携
  {
    'tyru/open-browser.vim',
    config = function()
      require('plugins.configs.open-browser')
    end,
  },

  -- コメント
  {
    'tomtom/tcomment_vim',
    config = function()
      require('plugins.configs.tcomment')
    end,
  },

  -- 実行
  {
    'thinca/vim-quickrun',
    config = function()
      require('plugins.configs.quickrun')
    end,
  },

  -- 検索置換サポート
  { 'tpope/vim-abolish' },

  -- リンター
  {
    'w0rp/ale',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugins.configs.ale')
    end,
  },

  -- LSP（COC）
  {
    'neoclide/coc.nvim',
    branch = 'release',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.coc')
    end,
  },

  -- ステータスライン
  {
    'itchyny/lightline.vim',
    config = function()
      require('plugins.configs.lightline')
    end,
  },

  -- インデントガイド
  {
    'nathanaelkane/vim-indent-guides',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.indent-guides')
    end,
  },

  -- カラープレビュー
  {
    'lilydjwg/colorizer',
    cmd = { 'ColorHighlight', 'ColorClear', 'ColorToggle' },
  },

  -- 言語別プラグイン
  {
    'tpope/vim-rails',
    ft = 'ruby',
  },

  -- その他
  { 'editorconfig/editorconfig-vim' },
  {
    'cespare/vim-toml',
    ft = 'toml',
  },
  {
    'kannokanno/previm',
    ft = 'markdown',
    dependencies = { 'tyru/open-browser.vim' },
  },
  {
    'hashivim/vim-terraform',
    ft = 'terraform',
    config = function()
      require('plugins.configs.terraform')
    end,
  },
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
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})