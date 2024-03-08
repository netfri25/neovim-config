-- Debugger Adapter Protocol plugin
-- integrates with debuggers

return {
   'mfussenegger/nvim-dap',
   lazy = true,
   -- ft = { 'c', 'cpp', 'rust' },

   keys = {
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = "dap toggle breakpoint" },
      { '<leader>dc', function() require('dap').continue() end, desc = "dap continue" },
      { '<leader>dso', function() require('dap').step_over() end, desc = "dap step over" },
      { '<leader>dsi', function() require('dap').step_into() end, desc = "dap step into" },
      { '<leader>dr', function() require('dap').repl_open() end, desc = "dap open REPL" },
   },

   config = function()
      local dap = require('dap')

      dap.adapters.codelldb = {
         type = 'server',
         port = '${port}',
         executable = {
            command = vim.fn.exepath('codelldb'),
            args = { '--port', '${port}' }
         }
      }

      dap.configurations.c = {
         {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function() return vim.fn.input('Path to executable: ') end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
         },
      }

      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
   end,
}
