return {
   'numToStr/FTerm.nvim',
   lazy = true,

   keys = {
      {
         '<C-\\>',
         function() require('FTerm').toggle() end,
         silent = true,
         desc = 'Toggle FTerm',
         mode = { 'n', 't' }
      }
   },

   opts = {
      ft = 'FTerm',
      border = 'rounded',
      cmd = '/home/netfri/.cargo/bin/nu',
      auto_close = true,
      hl = 'NormalFloat',
      blend = vim.g.neovide and 30 or 0,

      dimensions = {
         width = 0.8,
         height = 0.8,
         x = 0.5,
         y = 0.32,
      },
   }
}
