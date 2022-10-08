local keymap = vim.keymap.set

-- Remap leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keymap('', '<space>', '<nop>', { silent = true, desc = 'Leader key' })

-- Normal --
-- Resize windows
keymap('n', '<A-up>', ':resize -2<cr>', { silent = true, desc = 'Resize window' })
keymap('n', '<A-down>', ':resize +2<cr>', { silent = true, desc = 'Resize window' })
keymap('n', '<A-left>', ':vertical resize -2<cr>', { silent = true, desc = 'Resize window' })
keymap('n', '<A-right>', ':vertical resize +2<cr>', { silent = true, desc = 'Resize window' })

-- Clear highlighted search patterns
keymap('n', '<C-l>', '<cmd>let @/=\'\'<cr>', { silent = true, desc = 'Clear highlighted search' })

-- Delete a character without saving it
keymap('n', 'x', '"_x', { silent = true, desc = 'Delete a single character' })

-- Move text up and down
keymap('n', '<A-k>', '<esc>:m .-2<cr>==', { silent = true, desc = 'Move text up' })
keymap('n', '<A-j>', '<esc>:m .+1<cr>==', { silent = true, desc = 'Move text down' })

-- Redo on shift-u instead of ctrl-r
keymap('n', 'U', '<C-r>', { silent = true, desc = 'Undo' })

-- Insert --
-- Autocomplete brackets, braces, parentheses and angles
keymap('i', '<A-[>', '[]<left>', { silent = true, desc = 'Autocomplete []' })
keymap('i', '<A-S-[>', '{}<left>', { silent = true, desc = 'Autocomplete {}' })
keymap('i', '<A-S-9>', '()<left>', { silent = true, desc = 'Autocomplete ()' })
keymap('i', '<A-S-,>', '<><left>', { silent = true, desc = 'Autocomplete <>' })

-- Press jk fast to exit insert mode
keymap('i', 'jk', '<esc>', { silent = true, desc = 'Exit insert mode' })

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', { silent = true, desc = 'Indent left' })
keymap('v', '>', '>gv', { silent = true, desc = 'Indent right' })

-- Edit without saving the deleted text
keymap('v', 'd', '"_d', { silent = true, desc = 'Delete' })
keymap('v', 'c', '"_di', { silent = true, desc = 'Change' })

-- Press jk fast to exit visual mode
keymap('v', 'jk', '<esc>', { silent = true, desc = 'Exit visual mode' })

-- Redo on shift-u instead of alt-r
keymap('v', 'U', '<A-r>', { silent = true, desc = 'Undo' })

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ':move \'>+1<cr>gv-gv', { silent = true, desc = 'Move text' })
keymap('x', 'K', ':move \'<-2<cr>gv-gv', { silent = true, desc = 'Move text' })
keymap('x', '<A-j>', ':move \'>+1<cr>gv-gv', { silent = true, desc = 'Move text' })
keymap('x', '<A-k>', ':move \'<-2<cr>gv-gv', { silent = true, desc = 'Move text' })
