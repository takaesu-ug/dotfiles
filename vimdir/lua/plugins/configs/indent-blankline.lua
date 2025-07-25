-- lua/plugins/configs/indent-blankline.lua
return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cond = function()
    -- vscodeではないときに有効にする
    return vim.g.vscode ~= 1
  end,
  main = "ibl",
  event = "BufReadPost",
  config = function()
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#eeefa0" })

    require("ibl").setup({
      indent = {
        char = "|",        -- 基本的な縦線
        smart_indent_cap = true,
      },
      scope = {
        enabled = true,
        char = "|",        -- スコープも同じ文字
        show_start = true,
        show_end = true,
        highlight = "IblScope",
      },
      exclude = {
        filetypes = { "help", "lazy", "mason" },
      },
    })
  end,
}
