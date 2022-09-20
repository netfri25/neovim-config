local ok, telescope = pcall(require, 'telescope')
if not ok then return end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope prefix is '\' (a.k.a <bslash>)

keymap("n", "<bslash>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<bslash>/", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<bslash>t", ":Telescope<CR>", opts)
keymap("n", "<bslash>b", ":Telescope buffers<CR>", opts)
keymap("n", "<bslash>fb", ":Telescope file_browser<CR>", opts)

local actions = require "telescope.actions"

local function mappings(_, map)
   map("n", "q", actions.close)
   map("i", "<C-q>", actions.close)
   map("n", "<bslash>", actions.select_default)
   map("i", "<bslash>", actions.select_default)
   return true
end

telescope.setup({
   defaults = {
      attach_mappings = mappings,
   },

   extensions = {
      file_browser = {
         hijack_netrw = true,
         attach_mappings = mappings,
      },

      hoogle = {
         attach_mappings = mappings,
      },
   },
})

telescope.load_extension("file_browser")
