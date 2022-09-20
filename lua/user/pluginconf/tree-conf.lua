local ok, tree = pcall(require, 'nvim-tree')
if not ok then return end

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

tree.setup({
   hijack_cursor = false,
   hijack_unnamed_buffer_when_opening = false,
   sync_root_with_cwd = true,

   filters = {
      dotfiles = false,
      custom = { "^.git$", "^.gitignore$" },
   },

   view = {
      number = false,
      relativenumber = false,
      adaptive_size = true,
      mappings = {
         custom_only = true,
         list = {
            { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
            { key = "<C-e>", action = "edit_in_place" },
            { key = "O", action = "edit_no_picker" },
            { key = { "\\", "<2-RightMouse>" }, action = "cd" },
            { key = "<C-v>", action = "vsplit" },
            { key = "<C-s>", action = "split" },
            { key = "<C-t>", action = "tabnew" },
            { key = "<", action = "prev_sibling" },
            { key = ">", action = "next_sibling" },
            { key = "P", action = "parent_node" },
            { key = "<BS>", action = "close_node" },
            { key = "<Tab>",  action = "preview" },
            { key = "K", action = "first_sibling" },
            { key = "J", action = "last_sibling" },
            { key = "I", action = "toggle_git_ignored" },
            { key = "H", action = "toggle_dotfiles" },
            { key = "U", action = "toggle_custom" },
            { key = "R", action = "refresh" },
            { key = "a", action = "create" },
            { key = "d", action = "remove" },
            { key = "r", action = "rename" },
            { key = "<C-r>", action = "full_rename" },
            { key = "x", action = "cut" },
            { key = "c", action = "copy" },
            { key = "p", action = "paste" },
            { key = "y", action = "copy_name" },
            { key = "Y", action = "copy_path" },
            { key = "gy", action = "copy_absolute_path" },
            { key = "[d", action = "prev_diag_item" },
            { key = "[g", action = "prev_git_item" },
            { key = "]d", action = "next_diag_item" },
            { key = "]g", action = "next_git_item" },
            { key = "-", action = "dir_up" },
            -- { key = "s", action = "system_open" },
            { key = "f", action = "live_filter" },
            { key = "F", action = "clear_live_filter" },
            { key = "q", action = "close" },
            { key = "E", action = "collapse_all" },
            { key = "e", action = "expand_all" },
            -- { key = "S", action = "search_node" },
            { key = ".", action = "run_file_command" },
            { key = "<C-k>", action = "toggle_file_info" },
            { key = "?", action = "toggle_help" },
            { key = "mm", action = "toggle_mark" },
            { key = "mv", action = "bulk_move" },
         }
      },

      float = {
         enable = false,
         open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 35,
            height = 20,
         },
      },
   },

   renderer = {
      icons = {
         show = {
            file = true,
            folder = false,
            folder_arrow = true,
            git = true,
         },
      },
   },

   diagnostics = {
      enable = true,
      show_on_dirs = true,
   },

   live_filter = {
      always_show_folders = false,
   },
})
