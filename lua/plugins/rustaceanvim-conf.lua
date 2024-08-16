return {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
         on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
            require('lsp-inlayhints').on_attach(client, bufnr)
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = 'Show previous diagnostics' })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = 'Show next diagnostics' })
            vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Show loclist' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = 'Goto declaration' })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = 'Goto definition' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = 'Show docs' })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { silent = true, desc = 'Goto implementation' })
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { silent = true, desc = 'Show signature help' })
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { silent = true, desc = 'Show type definition' })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = 'Rename symbol' })
            vim.keymap.set('n', '<leader>ca', function() require('tiny-code-action').code_action() end, { silent = true, desc = 'Code actions' })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true, desc = 'Show references' })
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { silent = true, desc = 'Format buffer' })
            vim.keymap.set('n', '<leader>u', require('nvim-navbuddy').open, { silent = true, desc = 'Open navbuddy' })
         end,

         default_settings = {
            ['rust-analyzer'] = {
               semanticHighlighting = {
                   nonStandardTokens = false
               },

               check = {
                  command = 'clippy'
               },

               checkOnSave = true,

               inlayHints = {
                  maxLength = 255,
               },

               imports = {
                  granularity = {
                     group = 'module',
                  },

                  preferPrelude = true,
               },

               completion = {
                  callable = {
                     snippets = 'none'
                  },

                  fullFunctionSignatures = {
                     enable = true,
                  },

                  postfix = {
                     enable = false,
                  },
               },

               snippets = {
                  custom = {
                  },
               },
            },
         },
      }

    end
}
