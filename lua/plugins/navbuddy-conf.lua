-- lsp items tree navigator

return {
   'SmiteshP/nvim-navbuddy',
   lazy = true,
   event = 'LspAttach',

   dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
   },

   keys = {
       { '<leader>u', function() require('nvim-navbuddy').open() end, desc = 'Open navbuddy' }
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
