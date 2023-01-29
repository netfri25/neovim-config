return {
   'aarondiel/spread.nvim',
   keys = {
      { '<leader>so', function() require('spread').out() end, silent = true, desc = 'Spread out' },
   },
}
