local function colorscheme_options()
   vim.o.cursorline = true
   vim.api.nvim_set_hl(0, 'CursorLine', {})
   vim.api.nvim_set_hl(0, 'FloatBorder', {})
   vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
   vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'NonText' })
end

vim.api.nvim_create_autocmd('ColorScheme', { callback = colorscheme_options })

-- might add something in the future that will remember the last colorscheme I used
-- local default_colorscheme = 'mellifluous'
local default_colorscheme = 'gruvbox'
vim.cmd.colorscheme(default_colorscheme)
