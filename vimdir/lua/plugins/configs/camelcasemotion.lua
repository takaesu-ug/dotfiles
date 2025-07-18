-- plugins/configs/camelcasemotion.lua

-- CamelCaseMotion設定
vim.keymap.set({'n', 'v'}, 'w', '<Plug>CamelCaseMotion_w', { silent = true })
vim.keymap.set({'n', 'v'}, 'b', '<Plug>CamelCaseMotion_b', { silent = true })
vim.keymap.set({'n', 'v'}, 'e', '<Plug>CamelCaseMotion_e', { silent = true })