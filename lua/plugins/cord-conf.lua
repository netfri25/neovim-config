

return {
    'vyfor/cord.nvim',
    branch = 'master',
    build = ':Cord update',
    event = 'VeryLazy',
    enabled = true,

    opts = {
        editor = {
            client = 'neovim',
            tooltip = "We're no strangers to love, you know the rules and so do I",
            icon = nil,
        },
        display = {
            swap_fields = false,
            swap_icons = true,
        },
        timestamp = {
            enabled = true,
            reset_on_idle = false,
            reset_on_change = false,
        },
        idle = {
            enabled = true,
            timeout = 5 * 60 * 1000,
            show_status = true,
            ignore_focus = true,
            smart_idle = true,
            details = 'Idle',
            state = nil,
            tooltip = '💤',
            icon = nil,
        },
        text = {
            viewing = function(opts) return 'Reading ' .. opts.filename end,
            editing = function(opts) return 'Demolishing ' .. opts.filename end,
            file_browser = function(opts) return 'Browsing files in ' .. opts.tooltip end,
            plugin_manager = function(opts) return 'Managing plugins in ' .. opts.tooltip end,
            lsp_manager = function(opts) return 'Configuring LSP in ' .. opts.tooltip end,
            docs = function(opts) return 'Reading ' .. opts.tooltip end,
            vcs = function(opts) return 'Committing changes in ' .. opts.tooltip end,
            workspace = function(opts) return 'Making ' .. opts.workspace_name .. ' unusable' end,
            dashboard = 'Home',
        },
        buttons = {
            {
                label = function(opts)
                    return opts.repo_url and 'View Repository' or 'Github Profile'
                end,

                url = function(opts)
                    return opts.repo_url or 'https://github.com/netfri25'
                end
            }
        },
        assets = nil,
        variables = nil,
        hooks = {
            on_ready = nil,
            on_update = nil,
            on_activity = nil,
            on_idle = nil,
            on_workspace_change = nil,
            on_disconnect = nil,
        },
        advanced = {
            plugin = {
                log_level = vim.log.levels.INFO,
                autocmds = true,
            },
            server = {
                pipe_path = nil,
                executable_path = nil,
                timeout = 60000,
            },
            cursor_update_mode = 'on_move',
            variables_in_functions = false,
        },
    }
}
