return {
   'neovim/nvim-lspconfig',
   lazy = false,

   dependencies = {
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
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


      local function on_attach(client, bufnr)
         client.server_capabilities.semanticTokensProvider = nil
         -- no need for that
         -- navbuddy.attach(client, bufnr)
         require('lsp-inlayhints').on_attach(client, bufnr)
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
         vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { silent = true, desc = 'Format buffer' })
         vim.keymap.set('n', '<leader>u', require('nvim-navbuddy').open, { silent = true, desc = 'Open navbuddy' })
      end

      lspconfig['pyright'].setup({
         -- capabilities = capabilities,
         capabilities = (function()
            local this_capabilities = vim.lsp.protocol.make_client_capabilities()
            this_capabilities.textDocument.completion.completionItem.snippetSupport = true
            this_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
            return this_capabilities
         end)(),

         on_attach = function(client, bufnr)
            client.server_capabilities.publish_diagnostics = false
            on_attach(client, bufnr)
         end,

         settings = {}
      })

      lspconfig['ruff_lsp'].setup({
         capabilities = capabilities,
         on_attach = function(client, bufnr)
            -- use pyright as the hover provider
            client.server_capabilities.hoverProvider = false
            on_attach(client, bufnr)
         end,
      })

      lspconfig['clangd'].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         cmd = { 'clangd', '--enable-config' }
      })

      lspconfig['hls'].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      lspconfig['lua_ls'].setup({
         capabilities = capabilities,
         on_attach = on_attach,

         settings = {
            Lua = {
               completion = {
                  callSnippet = 'Replace',
               },

               diagnostics = {
                  globals = { 'vim' },
               },

               workspace = {
                  library = vim.api.nvim_get_runtime_file('', true),
                  checkThirdParty = false,
               },

               runtime = { version = 'LuaJIT' },
            },
         },
      })
   end
}
