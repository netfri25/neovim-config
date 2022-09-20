vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")
vim.g.popui_border_style = 'rounded'
vim.cmd[[nnoremap <leader>p :lua require'popui.diagnostics-navigator'()<CR>]]
