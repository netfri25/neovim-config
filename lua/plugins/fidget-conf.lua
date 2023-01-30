return {
   'j-hui/fidget.nvim',

   event = 'VimEnter',

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
