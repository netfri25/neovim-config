-- togglable inline error messages

return {
   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
   lazy = true,

   keys = {
      {
         '<leader>l',
         function() require('lsp_lines').toggle() end,
         silent = true,
         desc = 'Toggle lsp-lines'
      }
   },

   config = true,
}
