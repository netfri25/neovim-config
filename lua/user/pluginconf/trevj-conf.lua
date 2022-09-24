local ok, trevj = pcall(require, 'trevj')
if not ok then return end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>j', '<cmd>lua require(\'trevj\').format_at_cursor()<cr>', opts)

trevj.setup({})
