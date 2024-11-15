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
               statusline = 100,
               tabline = 1000,
               winbar = 1000,
            }
         },

         -- NOTE: disabling the tabline for now, since I'm trying to be more efficient with multiple buffers
         -- tabline = {
         --    lualine_a = {
         --       {
         --          'buffers',

         --          max_length = function()
         --             return vim.o.columns
         --          end,

         --          symbols = {
         --             alternate_file = '',
         --          },

         --          buffers_color = {
         --             active = 'lualine_a_normal',
         --             inactive = 'lualine_b_normal',
         --          },
         --       }
         --    }
         -- },

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
            },

            lualine_c = {},
            lualine_b = {
               {
                  'filename',
                  file_status = false,
                  newfile_status = false,
                  path = 1,
                  separator = { left = '', right = '' },
                  color = 'lualine_c_normal',

                  --- @param name string
                  fmt = function(name, opts)
                     if vim.bo.filetype == 'oil' then
                        name = name:gsub('oil://', '', 1)
                        name = vim.fn.fnamemodify(name, ':~:.')
                        name = name:match('(.*)/') or name
                     elseif vim.bo.buftype == 'terminal' then
                        local command = name:match('term://.*:(.*)')
                        if not command then return name end
                        local path = name:match('term://(.*)/%d+:.*')
                        if not path then return name end
                        path = vim.fn.fnamemodify(path, ':~:.')
                        path = path:match('(.*)/') or path
                        name = path == '' and command or ('[' .. path .. ']: ' .. command)
                     end

                     return name
                  end,
               },
            },
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
