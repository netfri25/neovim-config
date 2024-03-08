local keymap = vim.keymap.set

-- Fix scrolling with the mouse
keymap({'n', 'i', 'v'}, '<scrollwheelup>', '<cmd>norm 2kzz<cr>', { silent = true, desc = 'Scroll upwards' })
keymap({'n', 'i', 'v'}, '<scrollwheeldown>', '<cmd>norm 2jzz<cr>', { silent = true, desc = 'Scroll downwards' })

-- Remap leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keymap('', '<space>', '<nop>', { silent = true, desc = 'Leader key' })

-- Press hj fast to return to normal mode
keymap({ 'i', 'v' }, 'hj', '<esc>', { silent = true, desc = 'Return to normal mode' })
keymap('t', 'hj', '<c-\\><c-n>', { silent = true, desc = 'Return to normal mode' })

-- Normal --
-- Resize windows
keymap('n', '<A-up>', ':resize -2<cr>', { silent = true, desc = 'Resize window' })
keymap('n', '<A-down>', ':resize +2<cr>', { silent = true, desc = 'Resize window' })
keymap('n', '<A-left>', ':vertical resize -2<cr>', { silent = true, desc = 'Resize window' })
keymap('n', '<A-right>', ':vertical resize +2<cr>', { silent = true, desc = 'Resize window' })

-- Quick jumps
keymap('n', 'L', '<end>', { silent = true, desc = 'Go to the end of the line' })
keymap('n', 'H', '<home>', { silent = true, desc = 'Go to the start of the line' })

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
keymap('i', '<A-{>', '{}<left>', { silent = true, desc = 'Autocomplete {}' })
keymap('i', '<A-(>', '()<left>', { silent = true, desc = 'Autocomplete ()' })
keymap('i', '<A-<>', '<><left>', { silent = true, desc = 'Autocomplete <>' })

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', { silent = true, desc = 'Indent left' })
keymap('v', '>', '>gv', { silent = true, desc = 'Indent right' })

-- Redo on shift-u instead of alt-r
keymap('v', 'U', '<A-r>', { silent = true, desc = 'Undo' })

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ':move \'>+1<cr>gv-gv', { silent = true, desc = 'Move text' })
keymap('x', 'K', ':move \'<-2<cr>gv-gv', { silent = true, desc = 'Move text' })
keymap('x', '<A-j>', ':move \'>+1<cr>gv-gv', { silent = true, desc = 'Move text' })
keymap('x', '<A-k>', ':move \'<-2<cr>gv-gv', { silent = true, desc = 'Move text' })

-- Quickfix list
keymap('n', "<c-n>", "<cmd>cnext<cr>", { silent = true, desc = "Next item in the quickfix list" })
keymap('n', "<c-p>", "<cmd>cprev<cr>", { silent = true, desc = "Previous item in the quickfix list" })

-- Location list
keymap('n', "<A-n>", "<cmd>lnext<cr>", { silent = true, desc = "Next item in the location list" })
keymap('n', "<A-p>", "<cmd>lprev<cr>", { silent = true, desc = "Previous item in the location list" })
