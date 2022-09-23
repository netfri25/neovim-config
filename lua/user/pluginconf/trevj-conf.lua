local ok, trevj = pcall(require, 'trevj')
if not ok then return end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<leader>j', function() require('trevj').format_at_cursor() end, opts)

trevj.setup({})
