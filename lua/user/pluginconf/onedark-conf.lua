local ok, onedark = pcall(require, 'onedark')
if not ok then return end

onedark.setup({
	style = 'warmer',
	transparent = false,
	term_colors = true,
	ending_tildes = false,
	cmp_itemkind_reverse = false,

	-- toggle_style_key = '<c-s>',
	toggle_style_list = { 'dark', 'darker', 'warm', 'warmer', 'deep', 'cool' },

	code_styles = {
		comments = 'italic',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none',
	},

	lualine = {
		transparent = false,
	},

	colors = {},

	highlights = {
		['@parameter'] = { fg = '$fg' },
		-- ['@field'] = { fg = '$cyan' },
		-- ['@constructor'] = { fg = '$fg' },
		-- ['@function.builtin'] = { fg = '$cyan' },
		-- ['@constant.builtin'] = { fg = '$orange' },
		-- ['@function.macro'] = { fg = '$cyan' },
		-- ['@variable.builtin'] = { fg = '$red' },
		-- ['@label'] = { fg = '$red' },
		-- ['@operator'] = { fg = '#818387' },
		-- ['@namespace'] = { fg = '$yellow' },
		CursorLineNr = { fg = '$cyan' },

		MatchParen = {
			fg = '$red',
			bg = '#00000000',
			fmt = 'bold',
		},
	},

	diagnostics = {
		darker = true,
		undercurl = false,
		background = true,
	},
})
