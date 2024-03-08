-- treesitter for better text analysis, text objects and highlighting

local filetypes = {
   'c',
   'asm',
   'cpp',
   'vim',
   'lua',
   'rust',
   'json',
   'java',
   'toml',
   'fish',
   -- 'help',
   'ocaml',
   'python',
   'comment',
   'haskell',
   'markdown',
   'gitcommit',
   'git_rebase',
   'gitattributes',
}

return {
   'nvim-treesitter/nvim-treesitter',
   lazy = false,
   enabled = vim.loop.os_uname().sysname == "Linux",
   ft = filetypes,

   dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'rush-rs/tree-sitter-asm',
   },

   build = ':TSUpdate',

   config = function()
      local tree = require('nvim-treesitter.configs')
      local parsers = require('nvim-treesitter.parsers')

      parsers.get_parser_configs().asm = {
          install_info = {
              url = 'https://github.com/rush-rs/tree-sitter-asm.git',
              files = { 'src/parser.c' },
              branch = 'main',
          },
      }

      tree.setup({
         ignore_install = {},
         ensure_installed = filetypes,

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

         playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
               toggle_query_editor = 'o',
               toggle_hl_groups = 'i',
               toggle_injected_languages = 't',
               toggle_anonymous_nodes = 'a',
               toggle_language_display = 'I',
               focus_language = 'f',
               unfocus_language = 'F',
               update = 'R',
               goto_node = '<cr>',
               show_help = '?',
            },
         },

         indent = { enable = false },
      })
   end
}
