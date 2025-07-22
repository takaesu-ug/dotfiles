-- plugins/configs/lightline.lua
return {
  'itchyny/lightline.vim',
  lazy = false,
  priority = 1000,
  config = function()
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
        gitbranch = 'FugitiveHead',
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

    ---- 設定適用後に更新
    --vim.schedule(function()
    --  if vim.fn.exists('*lightline#init') == 1 then
    --    vim.fn['lightline#init']()
    --    vim.fn['lightline#colorscheme']()
    --    vim.fn['lightline#update']()
    --  end
    --end)

  end,
}


