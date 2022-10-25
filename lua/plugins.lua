return {
	'wbthomason/packer.nvim',
	'andweeb/presence.nvim',
	'folke/lsp-colors.nvim',
	'navarasu/onedark.nvim',
	'lambdalisue/suda.vim',
	'akinsho/toggleterm.nvim',
	'sainnhe/gruvbox-material',
	'lewis6991/impatient.nvim',
	'kyazdani42/nvim-web-devicons',
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	'ntpeters/vim-better-whitespace',
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	{
		'nvim-lua/lsp_extensions.nvim',
		run = function()
			require('lsp_extensions').inlay_hints({ enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } })
		end
	},

	'simrat39/rust-tools.nvim',
	{ 'hood/popui.nvim', requires = 'RishabhRD/popfix' },
	'kyazdani42/nvim-tree.lua',
	'numToStr/Comment.nvim',
	'nvim-lualine/lualine.nvim',
	'j-hui/fidget.nvim',
	'Mofiqul/vscode.nvim',
	'ofirgall/ofirkai.nvim',
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	'sitiom/nvim-numbertoggle',
	{ 'nagy135/typebreak.nvim', requires = 'nvim-lua/plenary.nvim' },
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'nvim-treesitter/playground',
	{ 'meliora-theme/neovim', requires = 'rktjmp/lush.nvim' },
	{ 'justinhj/battery.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim' } }, -- also needs 'acpi'
	'smjonas/live-command.nvim',
}
