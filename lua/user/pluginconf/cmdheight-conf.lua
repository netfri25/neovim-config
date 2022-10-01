local group = vim.api.nvim_create_augroup('CmdheightChanger', { clear = true })

vim.api.nvim_create_autocmd('CmdlineEnter', {
   command = 'set cmdheight=2',
   group = group,
})

vim.api.nvim_create_autocmd('CmdlineLeave', {
   command = 'set cmdheight=0',
   group = group,
})

vim.api.nvim_create_autocmd('CmdlineChanged', {
   command = 'redraw',
   group = group,
})
