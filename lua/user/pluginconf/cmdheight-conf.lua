-- local group = vim.api.nvim_create_augroup('CmdheightChanger', { clear = true })

vim.keymap.set('c', '<cr>', '<cr><cmd>set cmdheight=0<cr>', { silent = true })
vim.keymap.set('c', '<esc>', '<cr><cmd>set cmdheight=0<cr>', { silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, ':', '<cmd>set cmdheight=2<cr>:', { silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, ';', '<cmd>set cmdheight=2<cr>:', { silent = true })

-- vim.api.nvim_create_autocmd('CmdlineEnter', {
--    command = 'set cmdheight=2',
--    group = group,
-- })
--
-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--    command = 'set cmdheight=0',
--    group = group,
-- })
