-- lua/plugins/configs/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "ruby",
        "javascript",
        "python",
        "vim",
        "vimdoc",
        "html",
        "query",
      },
      auto_install = true,
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
