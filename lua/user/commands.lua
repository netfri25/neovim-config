vim.api.nvim_create_autocmd('Filetype', {
   pattern = 'haskell',
   command = 'setlocal shiftwidth=2 | setlocal softtabstop=2',
})

vim.api.nvim_create_autocmd('Filetype', {
   pattern = 'json',
   command = 'syntax match Comment +\\/\\/.\\+$+',
})

vim.api.nvim_create_autocmd('Filetype', {
   pattern = 'help',
   callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.keymap.set('n', 'q', '<cmd>:q<cr>', {
         buffer = buf,
         silent = true,
         desc = 'Quit the help buffer',
      })
   end
})

-- easy reloading the entire config
vim.api.nvim_create_user_command('Reload', function()
   local path = vim.fn.stdpath('config') .. '/init.lua'
   vim.api.nvim_command('source ' .. path)
end, {})

-- highlighting yanked text regions
vim.api.nvim_create_autocmd('TextYankPost', {
   pattern = '*',
   callback = function()
      vim.api.nvim_command([[ silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 } ]])
   end
})
