local ok, lualine = pcall(require, "lualine")
if not ok then return end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "[b", "<cmd>bprevious<cr>", opts)
keymap("n", "]b", "<cmd>bnext<cr>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", opts)
keymap("n", "<leader>bb", "<cmd>silent! exe \"LualineBuffersJump\" . v:count<cr>", opts)

lualine.setup({
   options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},

      disabled_filetypes = {
         statusline = {},
         winbar = {},
      },

      ignore_focus = {'NvimTree'},
      always_divide_middle = true,
      globalstatus = true,

      refresh = {
         statusline = 1000,
         tabline = 1000,
         winbar = 1000,
      }
   },

   sections = {
      lualine_a = {
         {
            'buffers',

            filetype_names = {
               NvimTree = "File explorer",
            },

            symbols = {
               alternate_file = '',
            },
         }
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'diagnostics', 'diff', 'branch'},
      lualine_z = {'mode'},
   },

   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {},
   },

   tabline = {},

   winbar = {},
   inactive_winbar = {},
   extensions = {}
})
