-- ui/colors.lua - カラースキーム設定

-- カラースキームはプラグインがロードされた後に設定するため、
-- ここでは基本的な設定のみ行う

-- True Colorサポート
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

-- カラースキーム設定用の関数（プラグインロード後に呼び出される）
_G.setup_colorscheme = function()
  vim.cmd('colorscheme hybrid')
end