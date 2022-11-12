local ok, barbecue = pcall(require, 'barbecue')
if not ok then return end

vim.keymap.set('n', '<leader>bq', '<cmd>Barbecue toggle<cr>',
	{ silent = true, desc = 'Toggle Barbecue' })

-- turn it off by default
require('barbecue.ui'):toggle(false)

barbecue.setup({
	create_autocmd = true,
	include_buftypes = { '' },
	exclude_buftypes = { 'toggleterm', 'NvimTree' },

	custom_section = function()
		return ''
	end,

	modifiers = {
		dirname = ':~:.',
		basename = '',
	},

	symbols = {
		seperator = '>',
		modified = false,
		default_context = '…',
	},

	kinds = {
		File = "",
		Package = "",
		Module = "",
		Namespace = "",
		Macro = "",
		Class = "",
		Constructor = "",
		Field = "",
		Property = "",
		Method = "",
		Struct = "",
		Event = "",
		Interface = "",
		Enum = "",
		EnumMember = "",
		Constant = "",
		Function = "",
		TypeParameter = "",
		Variable = "",
		Operator = "",
		Null = "",
		Boolean = "",
		Number = "",
		String = "",
		Key = "",
		Array = "",
		Object = "",
	},
})
