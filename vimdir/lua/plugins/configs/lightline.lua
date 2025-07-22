-- plugins/configs/lightline.lua

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

-- Vimscript関数として定義
vim.cmd([[
function! LightlineFilename()
  let filename = expand('%') !=# '' ? expand('%') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
]])
