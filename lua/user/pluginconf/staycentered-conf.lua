local group = vim.api.nvim_create_augroup('Center', {
   clear = true,
})

vim.api.nvim_create_autocmd('CursorMoved', {
   pattern = '*',
   command = 'norm zz',
   group = group,
})

vim.api.nvim_create_autocmd('InsertLeave', {
   pattern = '*',
   command = 'norm zz',
   group = group,
})

vim.api.nvim_create_autocmd('TermLeave', {
   command = 'set scrolloff=0',
   group = group,
})
