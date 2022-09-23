vim.g.better_whitespace_ctermcolor = 'red'
vim.g.better_whitespace_guicolor = 'red'
vim.g.better_whitespace_enabled = 1
vim.g.srtip_whitespace_on_save = 0
vim.g.strip_whitelines_at_eof = 1

vim.api.nvim_set_keymap('n', '<A-l>', ':ToggleWhitespace<CR>', { silent = true })
