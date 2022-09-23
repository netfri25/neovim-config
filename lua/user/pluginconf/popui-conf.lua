vim.ui.select = require('popui.ui-overrider')
vim.ui.input = require('popui.input-overrider')
vim.g.popui_border_style = 'rounded'

vim.api.nvim_set_keymap(
   'n',
   '<leader>p',
   '<cmd>lua require(\'popui.diagnostics-navigator\')()<cr>',
   { noremap = true, silent = true }
)
