local ok, fterm = pcall(require, 'FTerm')
if not ok then return end

vim.keymap.set({ 'n', 't' }, '<C-\\>', fterm.toggle, { silent = true, desc = 'Toggle FTerm' })

fterm.setup({
   ft = 'FTerm',
   border = 'rounded',
   cmd = '/usr/bin/fish',
   auto_close = true,
})
