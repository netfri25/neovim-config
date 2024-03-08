-- file explorer plugin that lets me do file operations like a regular neovim text operations

return {
   'stevearc/oil.nvim',
   lazy = false,

   keys = {
      { '<leader>t', function() require('oil').open() end, desc = 'Open oil buffer in a new window' }
   },

   opts = {
      -- Id is automatically added at the beginning, and name at the end
      -- See :help oil-columns
      columns = {
         "icon",
         -- "permissions",
         -- "size",
         -- "mtime",
      },

      -- Buffer-local options to use for oil buffers
      buf_options = {
         buflisted = false,
         bufhidden = "hide",
      },

      -- Window-local options to use for oil buffers
      win_options = {
         wrap = false,
         signcolumn = "no",
         cursorcolumn = false,
         foldcolumn = "0",
         spell = false,
         list = false,
         conceallevel = 3,
         concealcursor = "n",
      },

      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`
      default_file_explorer = true,

      -- Restore window options to previous values when leaving an oil buffer
      restore_win_options = true,

      -- Skip the confirmation popup for simple operations
      skip_confirm_for_simple_edits = true,

      delete_to_trash = true,

      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = false,

      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
      -- Additionally, if it is a string that matches "actions.<name>",
      -- it will use the mapping at require("oil.actions").<name>
      -- Set to `false` to remove a keymap
      -- See :help oil-actions for a list of all available actions
      keymaps = {
         ["?"] = "actions.show_help",
         ["<CR>"] = "actions.select",
         ["<C-s>"] = "actions.select_vsplit",
         ["<C-h>"] = "actions.select_split",
         ["<C-t>"] = "actions.select_tab",
         ["<C-r>"] = "actions.refresh",
         ["H"] = "actions.parent",
         ["L"] = "actions.select",
         ["_"] = "actions.open_cwd",
         ["`"] = "actions.cd",
         ["g."] = "actions.toggle_hidden",
         ["q"] = "actions.close",
         ["<leader>t"] = "actions.close",
         ["Y"] = "actions.copy_entry_path",
         ["<tab>"] = "actions.preview",
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = false,
      view_options = {
         -- Show files and directories that start with "."
         show_hidden = true,
         -- This function defines what is considered a "hidden" file
         -- The second parameter is `bufnr`
         is_hidden_file = function(name, _)
            return vim.startswith(name, ".")
         end,
         -- This function defines what will never be shown, even when `show_hidden` is set
         is_always_hidden = function(name, _)
            local custom_files = {
               ['.git'] = true,
               ['.gitignore'] = false,
               ['target'] = true,
               ['.mypy_cache'] = true,
               ['__pycache__'] = true,
               ['.ruff_cache'] = true,
               ['.luarc.json'] = true,
               ['lazylock.json'] = true,
            }

            return custom_files[name] == true
         end,
      },
      -- Configuration for the floating window in oil.open_float
      float = {
         -- Padding around the floating window
         padding = 4,
         max_width = 140,
         max_height = 0,
         border = "rounded",
         win_options = {
            winblend = vim.g.neovide and 30 or 0,
         },
      },
      -- Configuration for the actions floating preview window
      preview = {
         -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
         -- min_width and max_width can be a single value or a list of mixed integer/float types.
         -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
         max_width = 0.9,
         -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
         min_width = { 40, 0.4 },
         -- optionally define an integer/float for the exact width of the preview window
         width = nil,
         -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
         -- min_height and max_height can be a single value or a list of mixed integer/float types.
         -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
         max_height = 0.9,
         -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
         min_height = { 5, 0.1 },
         -- optionally define an integer/float for the exact height of the preview window
         height = nil,
         border = "rounded",
         win_options = {
            winblend = 0,
         },
      },
      -- Configuration for the floating progress window
      progress = {
         max_width = 0.9,
         min_width = { 40, 0.4 },
         width = nil,
         max_height = { 10, 0.9 },
         min_height = { 5, 0.1 },
         height = nil,
         border = "rounded",
         minimized_border = "none",
         win_options = {
            winblend = 0,
         },
      }
   }
}
