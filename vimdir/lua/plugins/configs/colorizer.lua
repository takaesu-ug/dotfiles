-- lua/plugins/configs/colorizer.lua
-- :ColorToggle    " カラー表示の切り替え
-- :ColorHighlight " カラー表示を有効化
-- :ColorClear     " カラー表示を無効化
return {
  "lilydjwg/colorizer",
  ft = {
    "css", "scss", "sass", "less",
    "html", "xml", "markdown",
    "javascript", "typescript",
    "lua", "vim"
  },
  event = "BufReadPost",  -- ファイル読み込み時に有効化
  config = function()
    vim.g.colorizer_auto_color = 1
    vim.g.colorizer_skip_comments = 1
  end
}
