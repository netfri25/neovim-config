return {
   'aarondiel/spread.nvim',
   lazy = true,
   keys = {
      { '<leader>so', function() require('spread').out() end, silent = true, desc = 'Spread out' },
   },
}
