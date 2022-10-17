local quack, duck = pcall(require, 'duck')
if not quack then return end

vim.keymap.set('n', '<leader>dd', duck.hatch, { silent = true, desc = 'Release the duck' })
vim.keymap.set('n', '<leader>dk', duck.cook, { silent = true, desc = 'Cook the duck' })
