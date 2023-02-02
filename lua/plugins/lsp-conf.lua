return {
   'neovim/nvim-lspconfig',
   lazy = false,

   dependencies = {
      'folke/neodev.nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'nvim-lua/lsp_extensions.nvim',
   },

   config = function()
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = cmp_nvim_lsp.default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.diagnostic.config({
         virtual_text = false,
         virtual_lines = false, -- lsp_lines
         update_in_insert = true,
         underline = true,
         severity_sort = true,

         float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            header = '',
            prefix = '',
         },
      })

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

      -- lspconfig
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = 'Show previous diagnostics' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = 'Show next diagnostics' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { silent = true, desc = 'Show loclist' })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = 'Goto declaration' })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = 'Goto definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = 'Show docs' })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { silent = true, desc = 'Goto implementation' })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { silent = true, desc = 'Show signature help' })
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { silent = true, desc = 'Show type definition' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, desc = 'Code actions' })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true, desc = 'Show references' })
      vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end,
      { silent = true, desc = 'Format buffer' })

      lspconfig['pylsp'].setup({
         capabilities = capabilities,

         settings = {
            pylsp = {
               plugins = {
                  pycodestyle = {
                     ignore = { 'E501' },
                     maxLineLength = 120,
                  },
               },
            },
         },
      })

      lspconfig['clangd'].setup({
         capabilities = capabilities,
      })

      -- I'm not even a clojure programmer, but why not
      lspconfig['clojure_lsp'].setup({
         capabilities = capabilities,
      })

      lspconfig['hls'].setup({
         capabilities = capabilities,

         settings = {
            haskell = {
               plugin = {
                  hlint = {
                     globalOn = true,
                  },
               },
            }
         }
      })

      lspconfig['tsserver'].setup({
         capabilities = capabilities,
      })

      lspconfig['sumneko_lua'].setup({
         capabilities = capabilities,

         settings = {
            Lua = {
               completion = {
                  callSnippet = 'Replace',
               },

               diagnostics = {
                  globals = { 'vim' },
               },

               workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
               },

               runtime = { version = 'LuaJIT' },
            },
         },
      })
   end
}
