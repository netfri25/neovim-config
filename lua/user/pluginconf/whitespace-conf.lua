-- nice plugin for showing trailing whitespace
vim.g.better_whitespace_ctermcolor = 'red'
vim.g.better_whitespace_guicolor = 'red'
vim.g.better_whitespace_enabled = 1
vim.g.srtip_whitespace_on_save = 0
vim.g.strip_whitelines_at_eof = 1

vim.keymap.set('n', '<A-l>', '<cmd>ToggleWhitespace<cr>', { silent = true, desc = 'Toggle whitespace' })
