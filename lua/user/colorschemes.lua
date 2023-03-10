vim.api.nvim_create_autocmd('ColorScheme', {
   callback = function()
      vim.api.nvim_set_hl(0, 'CursorLine', {})
      vim.api.nvim_set_hl(0, 'FloatBorder', {})
      vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
   end
})

-- might add something in the future that will remember the last colorscheme I used
local default_colorscheme = 'mellifluous'

vim.cmd.colorscheme(default_colorscheme)
