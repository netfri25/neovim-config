return {
   'j-hui/fidget.nvim',
   lazy = true,

   event = 'VimEnter',
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
