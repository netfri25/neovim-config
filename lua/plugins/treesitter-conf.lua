return {
   'nvim-treesitter/nvim-treesitter',

   dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
   },

   build = ':TSUpdate',

   config = function()
      local tree = require('nvim-treesitter.configs')

      tree.setup({
         ensure_installed = {
            'c',
            'cpp',
            'vim',
            'lua',
            'rust',
            'java',
            'toml',
            'json',
            'fish',
            'help',
            'ocaml',
            'python',
            'haskell',
            'markdown',
            'gitcommit',
            'git_rebase',
            'gitattributes',
         },

         sync_install = false,
         auto_install = true,

         highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
         },

         textobjects = {
            select = {
               enable = true,
               lookahead = true,

               keymaps = {
                  ['if'] = { query = '@function.inner', desc = 'Select inner part of a function' },
                  ['af'] = { query = '@function.outer', desc = 'Select outer part of a function' },
                  ['ic'] = { query = '@class.outer', desc = 'Select inner part of a class' },
                  ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
               },

               selection_modes = {
                  ['@function.inner'] = 'v',
                  ['@function.outer'] = 'V',
                  ['@class.inner'] = 'V',
                  ['@class.outer'] = 'V',
               },
            },

            swap = {
               enable = true,
               lookahead = true,

               swap_next = {
                  ['<c-l>'] = { query = '@parameter.inner', desc = 'Swap parameter with the next parameter' },
               },

               swap_previous = {
                  ['<c-h>'] = { query = '@parameter.inner', desc = 'Swap parameter with the previous parameter' },
               },
            },

            lsp_interop = {
               enable = true,
               border = 'rounded',

               peek_definition_code = {
                  ['<leader>fd'] = '@function.outer',
                  ['<leader>cd'] = '@class.outer',
               },
            },
         },
      })
   end
}
