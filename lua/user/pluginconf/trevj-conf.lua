local ok, trevj = pcall(require, 'trevj')
if not ok then return end

vim.keymap.set('n', '<leader>j', trevj.format_at_cursor, { silent = true, desc = 'revJ' })

trevj.setup({})
