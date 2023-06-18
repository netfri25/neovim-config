-- also one of my favourite plugins.
-- looks so clean and nice while also allowing me to see all the open buffers so I
-- can easily navigate between them and see which ones I accidentally left open
return {
   'nvim-lualine/lualine.nvim',
   lazy = false,

   dependencies = {
      'justinhj/battery.nvim',
   },

   config = function()
      local lualine = require('lualine')
      local keymap = vim.keymap.set

      keymap('n', '[b', '<cmd>bprevious<cr>', { silent = true, desc = 'Switch to next buffer' })
      keymap('n', ']b', '<cmd>bnext<cr>', { silent = true, desc = 'Switch to previous buffer' })
      keymap('n', '[B', '<cmd>bfirst<cr>', { silent = true, desc = 'Switch to first buffer' })
      keymap('n', ']B', '<cmd>blast<cr>', { silent = true, desc = 'Switch to last buffer' })
      keymap('n', '<leader>bd', '<cmd>bdelete<cr>', { silent = true, desc = 'Delete buffer' })
      keymap('n', '<leader>bb', '<cmd>silent! exe \'LualineBuffersJump\' . v:count<cr>',
         { silent = true, desc = 'Jump to {count}th buffer' })

      lualine.setup({
         options = {
            icons_enabled = false,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },

            disabled_filetypes = {
               statusline = {},
               winbar = {},
            },

            ignore_focus = { 'NvimTree' },
            always_divide_middle = true,
            globalstatus = true,

            refresh = {
               statusline = 1000,
               tabline = 1000,
               winbar = 1000,
            }
         },

         tabline = {},

         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
         },

         sections = {
            lualine_a = {
               {
                  'datetime',
                  style = '%H:%M',
                  color = 'lualine_c_normal',
               },

               {
                  require('battery').get_status_line,
                  color = 'lualine_c_normal',
               },

               {
                  'buffers',

                  filetype_names = {
                     NvimTree = 'File explorer',
                     oil = 'Oil',
                     FTerm = 'Terminal',
                     CodeRunner = 'CodeRunner',
                  },

                  symbols = {
                     alternate_file = '',
                  },

                  buffers_color = {
                     active = 'lualine_a_normal',
                     inactive = 'lualine_b_normal',
                  },
               }
            },

            lualine_b = {},
            lualine_c = {},
            lualine_x = { 'diagnostics', 'diff', 'branch' },
            lualine_y = {},
            lualine_z = { 'mode' },
         },

         winbar = {},
         inactive_winbar = {},
         extensions = {}
      })
   end
}
