-- Lsp
-- configures lsp servers for neovim

return {
    'neovim/nvim-lspconfig',
    lazy = true,
    cmd = { "LspStart" },

    dependencies = {
        'saghen/blink.cmp',
    },

    config = function()
        local lspconfig = require('lspconfig')
        local configs = require('lspconfig.configs')
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        configs.onyx = {
            default_config = {
                cmd = { "onyx", "lsp" },
                filetypes = { "onyx" },
                root_dir = function(filename)
                    local utils = require "lspconfig.util"
                    return utils.search_ancestors(filename, function(path)
                        -- fs_stat DOES exist
                        if (vim.uv.fs_stat(table.concat({path, "onyx-lsp.kdl"})) or {}).type == 'file' then
                            return path
                        end
                    end)
                end;
                settings = {}
            }
        }

        configs.ante = {
            default_config = {
                cmd = { "ante-ls" },
                filetypes = { "ante" },
                root_dir = "."
            }
        }

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

        local function on_attach(client, bufnr)
            -- client.server_capabilities.semanticTokensProvider = nil
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics' })
            vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Show loclist' })
            vim.keymap.set('n', '<leader>Q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN }) end, { silent = true, desc = 'Show loclist' })
            vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, { silent = true, desc = 'Goto declaration' })
            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { silent = true, desc = 'Goto definition' })
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, { silent = true, desc = 'Show docs' })
            vim.keymap.set('n', '<c-s>', function() vim.lsp.buf.signature_help({ border = "rounded" }) end, { silent = true, desc = 'Show signature help' })
            vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition({ border = "rounded" }) end, { silent = true, desc = 'Show type definition' })
            vim.keymap.set('n', 'gra', function() vim.lsp.buf.code_action({ border = "rounded" }) end, { silent = true, desc = 'Code actions' })
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { silent = true, desc = 'Format buffer' })
        end

        lspconfig['koka'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['ante'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['onyx'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['arduino_language_server'].setup({
            cmd = {
                "arduino-language-server",
                "-clangd", "/usr/bin/clangd",
                "-cli", "/usr/bin/arduino-cli",
                "-cli-config", "/home/netfri/.arduino15/arduino-cli.yaml",
                "-fqbn", "arduino:avr:uno"
            },
            capabilities = capabilities,
            on_attach = on_attach,
        })

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
