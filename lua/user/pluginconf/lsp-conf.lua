local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then return end

local okok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not okok then return end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true


vim.diagnostic.config({
   virtual_text = true,
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
local keymaps_opts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, keymaps_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymaps_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymaps_opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, keymaps_opts)


-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { silent = true, noremap = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wl', function()
   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async=true }) end, bufopts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
-- vim.api.nvim_command('Format', vim.lsp.buf.formatting)


lspconfig['pylsp'].setup({
   capabilities = capabilities,
})

lspconfig['clangd'].setup({
   capabilities = capabilities,
})

lspconfig['clojure_lsp'].setup({
   capabilities = capabilities,
})

lspconfig['hls'].setup({
   capabilities = capabilities,
   settings = {
      haskell = {
         ['plugin.hlint.globalOn'] = true,
      }
   }
})

lspconfig['tsserver'].setup({
   capabilities = capabilities,
})

lspconfig['jsonls'].setup({
   capabilities = capabilities,
})

lspconfig['sumneko_lua'].setup({
   capabilities = capabilities,
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

require('rust-tools').setup({
   tools = {
      autoSetHints = true,
      inlay_hints = {
         show_parameter_hints = false,
         parameter_hints_prefix = '',
         other_hints_prefix = '',
      },
   },

   ['server.settings.rust-analyzer.checkOnSave.command'] = 'clippy',
   ['server.settings.rust-analyzer.inlayHints.maxLength'] = 'null',
})
