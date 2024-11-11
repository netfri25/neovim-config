return {
    "slugbyte/lackluster.nvim",
    lazy = false,
    config = function()
        local lackluster = require('lackluster')
        lackluster.setup({
            -- You can overwrite the following syntax colors by setting them to one of...
            --   1) a hexcode like "#a1b2c3" for a custom color.
            --   2) "default" or nil will just use whatever lackluster's default is.
            tweak_syntax = {
                string = "default",
                -- string = "#a1b2c3", -- custom hexcode
                -- string = color.green, -- lackluster color
                string_escape = "default",
                -- comment = "default",
                builtin = "default", -- builtin modules and functions
                type = "default",
                keyword = "default",
                keyword_return = "default",
                keyword_exception = "default",
                comment = lackluster.color.gray4,
            },
            -- You can overwrite the following background colors by setting them to one of...
            --   1) a hexcode like "#a1b2c3" for a custom color
            --   2) "none" for transparency
            --   3) "default" or nil will just use whatever lackluster's default is.
            tweak_background = {
                normal = lackluster.color.gray2,    -- main background
                -- normal = 'none',    -- transparent
                -- normal = '#a1b2c3',    -- hexcode
                -- normal = color.green,    -- lackluster color
                telescope = 'default', -- telescope
                menu = 'default',      -- nvim_cmp, wildmenu ... (bad idea to transparent)
                popup = 'default',     -- lazy, mason, whichkey ... (bad idea to transparent)
            },

            tweak_highlight = {
                ['MiniTrailspace'] = {
                    reverse = true,
                    fg = '#99423d',
                    bg = '#99423d',
                },

                ['NonText'] = {
                    overwrite = true,
                    link = 'Comment',
                },

                ['@type'] = {
                    overwrite = true,
                    fg = lackluster.color.gray6,
                },

                ['@function'] = {
                    overwrite = true,
                    link = '@variable',
                },

                ['@function.call'] = {
                    overwrite = true,
                    link = '@variable',
                },

                ['@variable.parameter'] = {
                    overwrite = true,
                    link = '@variable',
                },

                ['@variable.member'] = {
                    overwrite = true,
                    link = '@variable',
                },
            }
        })
    end
}
