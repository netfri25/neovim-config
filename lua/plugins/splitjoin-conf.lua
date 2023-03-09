return {
   'bennypowers/splitjoin.nvim',
   lazy = true,
   keys = {
      -- Spread join
      { '<leader>sj', function() require('splitjoin').join() end, desc = 'Join the object under cursor' },
      -- Spread out
      { '<leader>so,', function() require('splitjoin').split() end, desc = 'Split the object under cursor' },
   },
}
