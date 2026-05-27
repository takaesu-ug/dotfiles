-- lua/plugins/configs/treesitter.lua
-- nvim-treesitter main ブランチ (Neovim 0.12+ 用の書き直し版)
-- master ブランチはアーカイブ予定のため移行
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  config = function()
    local ensure_installed = {
      "diff",
      "lua",
      "ruby",
      "javascript",
      "python",
      "vim",
      "vimdoc",
      "html",
      "markdown",
      "markdown_inline",
      "sql",
      "bash",
      "typescript",
      "tsx",
      "yaml",
    }

    require("nvim-treesitter").install(ensure_installed)

    -- ハイライトを有効化
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if not ok then return end
        -- インデント (experimental)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
