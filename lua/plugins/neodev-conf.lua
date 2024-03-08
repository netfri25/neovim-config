-- support for nvim lua api

return {
   'folke/neodev.nvim',
   lazy = true,
   dependencies = { 'neovim/nvim-lspconfig' },
   ft = 'lua',
   config = true,
}
