-- lsp items tree navigator

return {
   'SmiteshP/nvim-navbuddy',
   lazy = true,
   event = 'LspAttach',

   dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
   },

   opts = {
      window = {
         border = 'rounded',
         size = "50%",
         position = "50%",
      },

      lsp = {
         auto_attach = true,
      },

      source_buffer = {
         highlight = true,
         reorient = "none",
      },
   }
}
