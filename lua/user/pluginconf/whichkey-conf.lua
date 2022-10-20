-- amazing plugin.
-- I'm too lazy to add all of my keymaps to this plugin (might do that in the future), but this
-- plugin did help me a lot in learning how to use vim motions and keymaps
local ok, whichkey = pcall(require, 'which-key')
if not ok then return end

whichkey.setup({
	spelling = {
		enabled = true,
		suggestions = 10,
	},

	key_labels = {
		['<cr>'] = '<ret>',
	},

	window = {
		border = 'rounded',
		margin = { 2, 2, 2, 1 }
	},

	layout = {
		height = { min = 4, max = 20 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = 'center',
	}
})
