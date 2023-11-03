vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Comment highlight for json files',
   pattern = 'json',
   command = 'syntax match Comment +\\/\\/.\\+$+',
})

vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Specific filetype indentation',
   pattern = 'haskell',
   command = 'setlocal shiftwidth=2 | setlocal softtabstop=2 | setlocal expandtab',
})

vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Specific filetype indentation',
   pattern = 'rust',
   command = 'setlocal shiftwidth=4 | setlocal tabstop=4',
})

vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Specific filetype indentation',
   pattern = 'c,cpp',
   command = 'setlocal shiftwidth=4 | setlocal tabstop=4',
})

vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Spell checking in gitcommit',
   pattern = 'gitcommit',
   command = 'set spell',
})

vim.api.nvim_create_autocmd('FileType', {
   desc = 'Comment string for c & cpp files',
   pattern = 'c,cpp',
   command = 'setlocal commentstring=\\/\\/\\ %s',
})

vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Adds key mappings for the `help` buffer',
   pattern = 'help',
   callback = function()
      local buf = vim.api.nvim_get_current_buf()

      vim.keymap.set('n', 'q', '<cmd>:q<cr>', {
         buffer = buf,
         silent = true,
         desc = 'Quit the help buffer',
      })

      vim.keymap.set('n', 'gr', '<c-]>', {
         buffer = buf,
         silent = true,
         desc = 'Jump to reference',
      })
   end
})
vim.api.nvim_create_autocmd({ 'TermLeave' ,'TermClose' }, {
   desc = 'Resets the scroll offset that the terminal buffer changes',
   callback = function()
      vim.o.scrolloff = 100
   end
})

-- easy reloading the entire config
vim.api.nvim_create_user_command('Reload', function()
   local path = vim.fn.stdpath('config') .. '/init.lua'
   vim.api.nvim_command('source ' .. path)
end, { desc = 'Reloads the user configuration' })

local hi_yank_group = vim.api.nvim_create_augroup('HighlightYank', { clear = true })

-- highlighting yanked text regions
vim.api.nvim_create_autocmd('TextYankPost', {
   desc = 'Highlights the yanked text on yank',
   group = hi_yank_group,
   pattern = '*',
   callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 });
   end
})

local group = vim.api.nvim_create_augroup('Center', { clear = true })

vim.api.nvim_create_autocmd('CursorMoved', {
   pattern = '*',
   callback = function()
      if vim.api.nvim_get_mode().mode == "n" then
         vim.cmd("norm zz")
      end
   end,
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
