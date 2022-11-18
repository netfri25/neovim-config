vim.api.nvim_create_autocmd('CursorMoved', {
   pattern = '*',
   command = 'norm zz',
})
