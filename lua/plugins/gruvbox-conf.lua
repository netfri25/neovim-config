-- Colorscheme

return {
   'ellisonleao/gruvbox.nvim',
   lazy = false,

   config = function()
      local contrast = 'hard' -- can be 'hard', 'soft' or empty string
      require('gruvbox').setup({
         undercurl = true,
         underline = true,
         bold = true,
         italic = {
            strings = false,
            comments = true,
            operators = false,
            folds = true,
         },
         strikethrough = true,
         invert_selection = false,
         invert_signs = false,
         invert_tabline = false,
         invert_intend_guides = false,
         inverse = true, -- invert background for search, diffs, statuslines and errors
         contrast = contrast,
         palette_overrides = {},

         overrides = {
            SignColumn = { link = 'Background' },
            LspInlayHint = { fg = '#666666', italic = true },
            MatchParen = { link = 'GruvboxOrange' },
            NormalFloat = { link = 'Normal' },

            GruvboxRedUnderline = { underline = true, undercurl = false },
            GruvboxGreenUnderline = { underline = true, undercurl = false },
            GruvboxYellowUnderline = { underline = true, undercurl = false },
            GruvboxBlueUnderline = { underline = true, undercurl = false },
            GruvboxPurpleUnderline = { underline = true, undercurl = false },
            GruvboxAquaUnderline = { underline = true, undercurl = false },
            GruvboxOrangeUnderline = { underline = true, undercurl = false },

            Pmenu = { link = 'Background' },
            PmenuSel = { link = 'Background' },
            PmenuSbar = { link = 'Background' },
            PmenuThumb = { link = 'Background' },

            DiffAdd = { link = 'GruvboxGreenSign' },
            DiffDelete = { link = 'GruvboxRedSign' },

            Operator = { link = 'GruvboxFg4' }, -- operators

            ['@variable'] = { link = 'GruvboxFg2' }, -- variables
            ['@field'] = { link = '@variable' }, -- variables
            ['@variable.member'] = { link = '@variable' }, -- variables
            ['@variable.parameter'] = { link = '@variable' }, -- variables
            ['@parameter'] = { link = '@variable' }, -- variables
            -- ['@constructor'] = { link = 'Operator' }, -- operators
            ['@punctuation.delimiter'] = { link = 'Operator' }, -- operators
            ['@punctuation.bracket'] = { link = 'Operator' }, -- operators
            ['@punctuation.special'] = { link = 'Operator' }, -- operators
            ['@type.qualifier'] = { link = '@variable.builtin' },
         },

         dim_inactive = false,
         transparent_mode = false,
      })
   end
}
