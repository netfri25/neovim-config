local ok, lines = pcall(require, 'lsp_lines')
if not ok then return end

lines.setup()

vim.keymap.set('n', '<leader>l', lines.toggle, { silent = true, desc = 'Toggle lsp-lines' })
