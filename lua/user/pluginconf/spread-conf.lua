local ok, spread = pcall(require, 'spread')
if not ok then return end

vim.keymap.set('n', '<leader>so', spread.out, { silent = true, desc = 'Spread out' })
vim.keymap.set('n', '<leader>sc', spread.out, { silent = true, desc = 'Spread combine' })
