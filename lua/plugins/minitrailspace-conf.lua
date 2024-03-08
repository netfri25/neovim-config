-- small plugin that marks trailing whitespaces

local enabled = true

local function switch(fun1, fun2)
   enabled = not enabled
   if enabled then
      return fun1
   else
      return fun2
   end
end

return {
   'echasnovski/mini.trailspace',
   lazy = false,

   config = function()
      local trailspace = require('mini.trailspace')
      trailspace.setup()
      vim.api.nvim_create_user_command("TrimWhitespace", trailspace.trim, { desc = "Trim whitespace" })
      vim.keymap.set('n', '<leader>w', function() switch(trailspace.highlight, trailspace.unhighlight)() end,
         { silent = true, desc = 'Toggle trailing whitespace' })
   end,
}
