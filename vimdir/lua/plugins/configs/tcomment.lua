-- plugins/configs/tcomment.lua
return {
  'tomtom/tcomment_vim',
  event = "VeryLazy",
  config = function()
    -- tcomment設定
    vim.g.tcomment_mapleader1 = '<C-_>'
    vim.g.tcomment_opleader1 = 'gc'

    -- ファイルタイプ別のコメント設定
    vim.g.tcomment_types = {
      ruby = '# %s',
      python = '# %s',
      javascript = '// %s',
      lua = '-- %s',
      vim = '" %s',
    }

    -- 追加設定
    vim.g.tcomment_textobject_inlinecomment = 'ic'
    vim.g.tcomment_close_empty_lines = 1
  end,
}

