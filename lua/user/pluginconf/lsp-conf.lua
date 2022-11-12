local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then return end

local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_ok then return end

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local navic_ok, navic = pcall(require, 'nvim-navic')

local on_attach
if navic_ok then
   on_attach = function(client, bufnr)
      if client.server_capabilities['documentSymbolProvider'] then
         navic.attach(client, bufnr)
      end
   end
else
   on_attach = function() end
end

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
-- local opts = { silent = true, noremap = true }
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
   on_attach = on_attach,

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
   on_attach = on_attach,
})

-- I'm not even a clojure programmer, but why not
lspconfig['clojure_lsp'].setup({
   capabilities = capabilities,
   on_attach = on_attach,
})

lspconfig['hls'].setup({
   capabilities = capabilities,
   on_attach = on_attach,

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
   on_attach = on_attach,
})

lspconfig['jsonls'].setup({
   capabilities = capabilities,
   on_attach = on_attach,
})

lspconfig['sumneko_lua'].setup({
   capabilities = capabilities,
   on_attach = on_attach,

   settings = {
      Lua = {
         runtime = { version = 'LuaJIT' },
         diagnostics = { globals = { 'vim' } },
         workspace = {
            library = {
               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
               [vim.fn.stdpath('config') .. '/lua'] = true,
            },
         },
      },
   },
})

-- if you have rust-analyzer installed through rustup, use it.
-- if its a standalone binary executable, use it instead
local rust_analyzer_command
if vim.fn.executable('rustup') == 1 then
   rust_analyzer_command = { 'rustup', 'run', 'stable', 'rust-analyzer' }
else
   rust_analyzer_command = { 'rust-analyzer' }
end

require('rust-tools').setup({
   tools = {
      autoSetHints = true,
      inlay_hints = {
         show_parameter_hints = false,
         parameter_hints_prefix = '',
         other_hints_prefix = '',
      },
   },

   server = {
      cmd = rust_analyzer_command,
      capabilities = capabilities,
      on_attach = on_attach,

      settings = {
         ['rust-analyzer'] = {
            checkOnSave = {
               command = 'clippy',

               inlayHints = {
                  maxLength = 'null',
               },
            },
         },
      },
   },
})
