-- lua/plugins/configs/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "diff",
        "lua",
        "ruby",
        "javascript",
        "python",
        "vim",
        "vimdoc",
        "html",
        "markdown",
        "sql",
        "bash",
        "typescript",
        "tsx",
        "yaml",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
