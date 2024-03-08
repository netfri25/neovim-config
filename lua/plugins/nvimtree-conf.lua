-- file tree explorer plugin (I'm using oil.nvim instead of this)

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings not inserted as:
  --  remove_keymaps = true
  --  OR
  --  view.mappings.custom_only = true


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'i', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<cr>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<C-i>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
  vim.keymap.set('n', '\\', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'l', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', '<bs>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
  vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
  vim.keymap.set('n', '[g', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', ']g', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', 'h', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<esc>', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'E', api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', 'e', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
  vim.keymap.set('n', '<c-k>', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'mm', api.marks.toggle, opts('Toggle Bookmark'))
  vim.keymap.set('n', 'mv', api.marks.bulk.move, opts('Move Bookmarked'))
end

return {
   'nvim-tree/nvim-tree.lua',
   lazy = false,
   enabled = false,

   keys = {
      { '<leader>t', '<cmd>NvimTreeToggle<cr>', silent = true, desc = 'Toggle file browser' },
   },

   config = function()
      local ok, tree = pcall(require, 'nvim-tree')
      if not ok then return end

      tree.setup({
         on_attach = on_attach,
         disable_netrw = false,
         hijack_netrw = true,
         hijack_cursor = true,
         hijack_unnamed_buffer_when_opening = false,
         sync_root_with_cwd = true,

         filters = {
            dotfiles = false,
            custom = {
               '^.git$',
               '^.gitignore$',
               '^target$',
               '^.mypy_cache$',
               '^__pycache__$',
               '^.ruff_cache$',
            },
         },

         actions = {
            use_system_clipboard = false,

            open_file = {
               quit_on_open = true,
            },

            file_popup = {
               open_win_config = {
                  relative = 'cursor',
                  border = 'rounded',
                  style = 'minimal',
               },
            },
         },

         view = {
            number = false,
            relativenumber = false,
            adaptive_size = true,
            -- keeping this if I would ever want to go back into floating window
            float = {
               enable = false,
               open_win_config = {
                  relative = 'editor',
                  border = 'rounded',
                  width = 35,
                  height = 20,
               },
            },
         },

         renderer = {
            icons = {
               show = {
                  file = true,
                  -- the folder icon is very useless
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

         -- I'm not using it anymore, but I will if its going to improve
         live_filter = {
            always_show_folders = false,
         },
      })
   end
}
