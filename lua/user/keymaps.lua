local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- remap leader to space
keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Resize windows
keymap("n", "<A-up>", ":resize -2<CR>", opts)
keymap("n", "<A-down>", ":resize +2<CR>", opts)
keymap("n", "<A-left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)

-- Redo on shift-u instead of ctrl-r
keymap("n", "U", "<C-r>", opts)

-- Delete without writing to the buffer
keymap("n", "<leader>d", "\"_d", opts)

-- Autocomplete brackets, braces, parentheses and angles
keymap("i", "<A-[>", "[]<left>", opts)
keymap("i", "<A-{>", "{}<left>", opts)
keymap("i", "<A-(>", "()<left>", opts)
keymap("i", "<A-lt>", "<><left>", opts)

-- Switch and delete buffers
-- keymap("n", "]b", ":bnext<CR>", opts)
-- keymap("n", "[b", ":bprevious<CR>", opts)
-- keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Press jk fast to exit visual mode
keymap("v", "jk", "<ESC>", opts)

-- Redo on shift-u instead of alt-r
keymap("v", "U", "<A-r>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
