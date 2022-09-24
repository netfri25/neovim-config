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
local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.api.nvim_set_keymap('n', '[d', vim.diagnostic.goto_prev, opts)
vim.api.nvim_set_keymap('n', ']d', vim.diagnostic.goto_next, opts)
vim.api.nvim_set_keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)
vim.api.nvim_set_keymap('n', 'gD', vim.lsp.buf.declaration, opts)
vim.api.nvim_set_keymap('n', 'gd', vim.lsp.buf.definition, opts)
vim.api.nvim_set_keymap('n', 'K', vim.lsp.buf.hover, opts)
vim.api.nvim_set_keymap('n', 'gi', vim.lsp.buf.implementation, opts)
vim.api.nvim_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.api.nvim_set_keymap('n', '<leader>D', vim.lsp.buf.type_definition, opts)
vim.api.nvim_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.api.nvim_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.api.nvim_set_keymap('n', 'gr', vim.lsp.buf.references, opts)
vim.api.nvim_set_keymap('n', '<leader>f', vim.lsp.buf.formatting, opts)
-- I will uncomment the next line when neovim gets its 0.8 update
-- vim.api.nvim_set_keymap('n', '<leader>f', function() vim.lsp.buf.format({ async=true }) end, bufopts)

lspconfig['pylsp'].setup({
   capabilities = capabilities,
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

   ['server.cmd'] = rust_analyzer_command,

   ['server.settings.rust-analyzer'] = {
      ['checkOnSave.command'] = 'clippy',
      ['inlayHints.maxLength'] = 'null',
   }
})
