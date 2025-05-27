

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
        },
        display = {
            theme = 'default',
            flavor = 'accent',
            swap_fields = false,
            swap_icons = true,
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
    }
}
