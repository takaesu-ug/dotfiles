-- plugins/configs/accelerated-jk.lua

vim.g.accelerated_jk_acceleration_table = {10, 5, 3}

vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})