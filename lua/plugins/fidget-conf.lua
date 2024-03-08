-- Lsp progress
-- shows small lsp progress on the bottom right corner

return {
   'j-hui/fidget.nvim',
   lazy = true,

   event = 'LspAttach',
   tag = 'legacy',

   dependencies = {
      'neovim/nvim-lspconfig'
   },

   opts = {
      sources = {
         hls = {
            ignore = true,
         },
      },
   },
}
