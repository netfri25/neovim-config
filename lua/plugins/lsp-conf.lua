-- Lsp
-- configures lsp servers for neovim

return {
    'neovim/nvim-lspconfig',
    lazy = true,
    cmd = { "LspStart" },

    dependencies = {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'SmiteshP/nvim-navbuddy',
        'rachartier/tiny-code-action.nvim',
    },

    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false, -- lsp_lines
            update_in_insert = false,
            underline = true,
            severity_sort = true,

            float = {
                focusable = true,
                style = 'minimal',
                border = 'rounded',
                header = '',
                prefix = '',
            },
        })

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })


        local function on_attach(client, bufnr)
            -- client.server_capabilities.semanticTokensProvider = nil
            -- no need for that
            -- navbuddy.attach(client, bufnr)
            require('lsp-inlayhints').on_attach(client, bufnr)
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = 'Show previous diagnostics' })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = 'Show next diagnostics' })
            vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Show loclist' })
            vim.keymap.set('n', '<leader>Q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARNING }) end, { silent = true, desc = 'Show loclist' })
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
        end

        lspconfig['pyright'].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities.publish_diagnostics = true
                client.server_capabilities.hoverProvider = true
                on_attach(client, bufnr)
            end,
        })

        lspconfig['ruff'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['rust_analyzer'].setup({
            cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
                on_attach(client, bufnr)
            end,

            settings = {
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
        })

        -- lspconfig['pylsp'].setup({
        --     capabilities = capabilities,
        --     on_attach = function(client, bufnr)
        --         -- client.server_capabilities.publish_diagnostics = true
        --         -- client.server_capabilities.hoverProvider = false
        --         -- client.server_capabilities.completion = false
        --         on_attach(client, bufnr)
        --     end,
        --     settings = {
        --         pylsp = {
        --             plugins = {
        --                 black = { enabled = true },
        --                 autopep8 = { enabled = false },
        --                 yapf = { enabled = false },
        --                 -- pylint = { enabled = false, executable = "pylint" },
        --                 pyflakes = { enabled = false },
        --                 pycodestyle = { enabled = true, ignore = { 'E501' } },
        --                 pydocstyle = { enabled = false },
        --                 -- mccabe = { enabled = false },
        --                 -- flake8 = { enabled = false },
        --                 -- ruff = { enabled = true },
        --                 pylsp_mypy = {
        --                     enabled = true,
        --                     overrides = { "--python-executable", vim.g.python3_host_prog, true },
        --                     report_progress = true,
        --                     live_mode = false
        --                 },
        --                 jedi_completion = { fuzzy = true },
        --             }
        --         }
        --     }
        -- })

        lspconfig['clangd'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { 'clangd', '--enable-config' }
        })

        lspconfig['hls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,

            settings = {
                haskell = {
                    maxCompletions = 200,
                    formattingProvider = 'stylish-haskell'
                }
            }
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

        lspconfig['prolog_ls'].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
                on_attach(client, bufnr)
            end,
        })

        lspconfig['roc_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end
}
