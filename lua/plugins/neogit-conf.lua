-- kinda like magit but for neovim. such a great tool

return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'sindrets/diffview.nvim',
    },

    lazy = true,

    keys = {{ '<leader>ng', function() require('neogit').open() end, silent = true, desc = 'Open neogit' }},
    cmd = { 'Neogit' },

    opts = {
        -- Hides the hints at the top of the status buffer
        disable_hint = false,
        -- Disables changing the buffer highlights based on where the cursor is.
        disable_context_highlighting = false,
        -- Disables signs for sections/items/hunks
        disable_signs = false,
        -- Do not ask to confirm the commit - just do it when the buffer is closed.
        disable_commit_confirmation = false,
        -- Uses `vim.notify` instead of the built-in notification system.
        disable_builtin_notifications = false,
        -- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
        -- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
        -- normal mode.
        disable_insert_on_commit = true,
        -- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
        -- events.
        filewatcher = {
            interval = 1000,
            enabled = false,
        },
        -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
        -- sorter instead. By default, this function returns `nil`.
        remember_settings = true,
        -- Scope persisted settings on a per-project basis
        use_per_project_settings = true,
        -- Table of settings to never persist. Uses format "Filetype--cli-value"
        ignored_settings = {
            "NeogitPushPopup--force-with-lease",
            "NeogitPushPopup--force",
            "NeogitPullPopup--rebase",
            "NeogitCommitPopup--allow-empty",
            "NeogitRevertPopup--no-edit",
        },
        -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
        -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
        auto_refresh = true,
        -- Value used for `--sort` option for `git branch` command
        -- By default, branches will be sorted by commit date descending
        -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
        -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
        sort_branches = "-committerdate",
        graph_style = "unicode",
        -- Change the default way of opening neogit
        kind = "replace",
        -- The time after which an output console is shown for slow running commands
        console_timeout = 10000,
        -- Automatically show console if a command takes more than console_timeout milliseconds
        auto_show_console = true,
        disable_line_numbers = false,
        disable_relative_line_numbers = false,
        status = {
            recent_commit_count = 100,
        },
        commit_editor = {
            kind = "split",
            show_staged_diff = false,
        },
        commit_select_view = {
            kind = "replace",
        },
        commit_view = {
            kind = "vsplit",
            verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
        },
        log_view = {
            kind = "replace",
        },
        rebase_editor = {
            kind = "split",
        },
        reflog_view = {
            kind = "replace",
        },
        merge_editor = {
            kind = "split",
        },
        preview_buffer = {
            kind = "split",
        },
        popup = {
            kind = "split",
        },
        signs = {
            -- { CLOSED, OPENED }
            hunk = { "", "" },
            item = { ">", "v" },
            section = { ">", "v" },
        },
        -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
        integrations = {
            -- If enabled, use telescope for menu selection rather than vim.ui.select.
            -- Allows multi-select and some things that vim.ui.select doesn't.
            telescope = true,
            -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
            -- The diffview integration enables the diff popup.
            --
            -- Requires you to have `sindrets/diffview.nvim` installed.
            diffview = true,

            -- If enabled, uses fzf-lua for menu selection. If the telescope integration
            -- is also selected then telescope is used instead
            -- Requires you to have `ibhagwan/fzf-lua` installed.
            fzf_lua = nil,
        },
        sections = {
            -- Reverting/Cherry Picking
            sequencer = {
                folded = false,
                hidden = false,
            },
            untracked = {
                folded = false,
                hidden = false,
            },
            unstaged = {
                folded = false,
                hidden = false,
            },
            staged = {
                folded = false,
                hidden = false,
            },
            stashes = {
                folded = true,
                hidden = false,
            },
            unpulled_upstream = {
                folded = true,
                hidden = false,
            },
            unmerged_upstream = {
                folded = false,
                hidden = false,
            },
            unpulled_pushRemote = {
                folded = true,
                hidden = false,
            },
            unmerged_pushRemote = {
                folded = false,
                hidden = false,
            },
            recent = {
                folded = true,
                hidden = false,
            },
            rebase = {
                folded = true,
                hidden = false,
            },
        },
        use_default_keymaps = true,
        mappings = {
            commit_editor = {
                ["q"] = "Close",
            },
            popup = {
                ["w"] = false,
            },
        },
    }
}
