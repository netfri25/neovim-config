local ok, fterm = pcall(require, 'FTerm')
if not ok then return end

vim.keymap.set({ 'n', 't' }, '<C-\\>', fterm.toggle, { silent = true, desc = 'Toggle FTerm' })

fterm.setup({
   ft = 'FTerm',
   border = 'none',
   cmd = '/usr/bin/fish',
   auto_close = true,

   dimensions = {
      width = 0.8,
      height = 0.8,
      x = 0.5,
      y = 0.32,
   },
})
