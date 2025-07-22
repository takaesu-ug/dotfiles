-- lua/plugins/configs/fugitive.lua
-- :Git blame
-- :Git status
-- :Git commit
-- :Git push
-- :Git pull
-- :Git diff
return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = function()
    local keymap = vim.keymap.set

    -- 正しいコマンド形式を使用
    keymap('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
    keymap('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git blame' })
    keymap('n', '<leader>gd', ':Git diff<CR>', { desc = 'Git diff' })
  end,
}
