return {
   'smjonas/live-command.nvim',
   lazy = false,
   config = function()
         require('live-command').setup({
         commands = {
            Norm = { cmd = 'norm' },
         },
      })
   end
}
