vim.api.nvim_create_autocmd('Filetype', {
   pattern = 'haskell',
   command = 'setlocal shiftwidth=2, softtabstop=2',
})

vim.api.nvim_create_autocmd('Filetype', {
   pattern = 'json',
   command = 'syntax match Comment +\\/\\/.\\+$+',
})

vim.api.nvim_create_user_command('Reload', function()
   local path = vim.fn.stdpath('config') .. '/init.lua'
   vim.api.nvim_command('source ' .. path)
end, {})

vim.api.nvim_create_autocmd('TextYankPost', {
   pattern = '*',
   callback = function()
      vim.api.nvim_command([[ silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 } ]])
   end
})
