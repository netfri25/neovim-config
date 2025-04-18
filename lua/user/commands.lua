vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopeFindPre",
    callback = function()
        vim.opt_local.winborder = "none"
        vim.api.nvim_create_autocmd("WinLeave", {
            once = true,
            callback = function()
                vim.opt_local.winborder = "rounded"
            end,
        })
    end,
})

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
   command = 'setlocal shiftwidth=4 | setlocal tabstop=4 | setlocal nocindent | setlocal nosmartindent',
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

vim.api.nvim_create_autocmd('FileType', {
   desc = 'Comment string for lolcode files',
   pattern = 'lolcode',
   command = 'setlocal commentstring=BTW\\ %s',
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

vim.api.nvim_create_autocmd({ 'TermEnter', 'TermOpen' }, {
   desc = 'Add a `q` keymap to quit the term buffer',
   callback = function()
      local buf = vim.api.nvim_get_current_buf()

      vim.keymap.set('n', 'q', '<cmd>:bd!<cr>', {
         buffer = buf,
         silent = true,
         desc = 'Quit the term buffer',
      })

      vim.keymap.set('n', 'r', function()
         local title = vim.b['term_title']
         vim.cmd('bd!')
         vim.cmd({ cmd = 'edit', args = { title } })
      end, {
         buffer = buf,
         silent = true,
         desc = 'Re-run the terminal command',
      })
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

-- vim.api.nvim_create_autocmd('CursorMoved', {
--    pattern = '*',
--    callback = function()
--       if vim.api.nvim_get_mode().mode == "n" then
--          vim.cmd("norm zz")
--       end
--    end,
--    group = group,
-- })

-- vim.api.nvim_create_autocmd('InsertLeave', {
--    pattern = '*',
--    command = 'norm zz',
--    group = group,
-- })

-- vim.api.nvim_create_autocmd('TermLeave', {
--    command = 'set scrolloff=100',
--    group = group,
-- })

-- make .roc files have the correct filetype
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.roc" },
  command = "set filetype=roc",
})

vim.api.nvim_create_autocmd('Filetype', {
   desc = 'Specific filetype options',
   pattern = 'markdown',
   command = 'setlocal wrap | setlocal linebreak',
})

