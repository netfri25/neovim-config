return {
   'numToStr/FTerm.nvim',

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
      cmd = '/usr/bin/fish',
      auto_close = true,

      dimensions = {
         width = 0.8,
         height = 0.8,
         x = 0.5,
         y = 0.32,
      },
   }
}