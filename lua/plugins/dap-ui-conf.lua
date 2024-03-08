-- UI for dap.nvim
-- really nice alternative for a gdb frontend

return {
   'rcarriga/nvim-dap-ui',
   dependencies = { 'mfussenegger/nvim-dap' },
   lazy = true,
   -- ft = { 'c', 'cpp', 'rust' },

   keys = {
      { '<leader>do', function() require('dapui').toggle() end, desc = "Toggle dap-ui" },
      { '<leader>da', function() require('dapui').eval() end, desc = "dap eval" },
   },

   config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
         dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
         dapui.close()
      end

      dapui.setup({
         floating = {
            border = 'rounded',
         }
      })
   end
}
