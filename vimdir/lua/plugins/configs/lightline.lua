-- plugins/configs/lightline.lua

-- ファイル名表示関数
local function lightline_filename()
  local filename = vim.fn.expand('%') ~= '' and vim.fn.expand('%') or '[No Name]'
  local modified = vim.bo.modified and ' +' or ''
  return filename .. modified
end

-- lightline設定
vim.g.lightline = {
  colorscheme = 'powerline',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'readonly', 'filename', 'ale' }
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
      { 'gitbranch', 'fileformat', 'fileencoding', 'filetype' }
    }
  },
  component_function = {
    gitbranch = 'fugitive#head',
    ale = 'ALEGetStatusLine',
    filename = 'LightlineFilename',
  }
}

-- ファイル名表示関数をグローバルに登録
_G.LightlineFilename = lightline_filename