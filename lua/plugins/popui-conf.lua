-- another favourite plugin.
-- makes UI look so clean and nice, with rounded edges for borders
return {
   'hood/popui.nvim',
   lazy = false,
   dependencies = { 'RishabhRD/popfix' },

   config = function()
      vim.ui.select = require('popui.ui-overrider')
      vim.ui.input = require('popui.input-overrider')
      vim.g.popui_border_style = 'rounded'

      vim.keymap.set(
         'n',
         '<leader>p',
         function() require('popui.diagnostics-navigator')() end,
         { silent = true, desc = 'Diagnostics navigator' }
      )
   end
}
