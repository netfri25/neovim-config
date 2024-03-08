-- fuzzy search for a lot of things
-- I can use it to find files, live grep, navigate open buffers, see help tags,
-- search keymaps, find lsp references and a whole lot more

local function builtin() return require('telescope.builtin') end

return {
   'nvim-telescope/telescope.nvim',
   lazy = true,

   branch = '0.1.x',
   dependencies = { 'nvim-lua/plenary.nvim' },

   keys = {
      { '<leader>ff', function() builtin().find_files() end, desc = "Telescope Find Files" },
      { '<leader>fg', function() builtin().live_grep() end, desc = "Telescope Live Grep" },
      { '<leader>fb', function() builtin().buffers() end, desc = "Telescope Buffers" },
      { '<leader>fh', function() builtin().help_tags() end, desc = "Telescope Help Tags" },
      { '<leader>fk', function() builtin().keymaps() end, desc = "Telescope Show Keymaps" },
      { '<leader>fr', function() builtin().lsp_references() end, desc = "Telescope Lsp References" },
   },

   config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
         defaults = {
            mappings = {
               n = {
                  ['hj'] = actions.close
               }
            },
         }
      })
   end,
}
