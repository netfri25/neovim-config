local ok, typebreak = pcall(require, 'typebreak')
if not ok then return end

vim.keymap.set('n', '<leader>bk', typebreak.start, { silent = true, desc = 'Typebreak' })
