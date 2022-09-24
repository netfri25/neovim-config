-- bootstrap packer
local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      vim.api.nvim_out_write('installing packer\n')
      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd [[packadd packer.nvim]]
      vim.api.nvim_out_write('finished installing packer\n')
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
   use { 'wbthomason/packer.nvim' }
   use { 'andweeb/presence.nvim' }
   use { 'folke/lsp-colors.nvim' }
   use { 'navarasu/onedark.nvim' }
   use { 'lambdalisue/suda.vim' }
   use { 'akinsho/toggleterm.nvim' }
   use { 'folke/which-key.nvim' }
   use { 'sainnhe/gruvbox-material' }
   use { 'lewis6991/impatient.nvim' }
   use { 'kyazdani42/nvim-web-devicons' }
   use { 'nvim-lua/plenary.nvim' }
   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
   use { 'ntpeters/vim-better-whitespace' }
   use { 'neovim/nvim-lspconfig' }
   use { 'hrsh7th/cmp-nvim-lsp' }
   use { 'hrsh7th/cmp-buffer' }
   use { 'hrsh7th/cmp-path' }
   use { 'hrsh7th/cmp-cmdline' }
   use { 'hrsh7th/nvim-cmp' }
   use { 'L3MON4D3/LuaSnip' }
   use { 'saadparwaiz1/cmp_luasnip' }
   use {
      'nvim-lua/lsp_extensions.nvim',
      run = function()
         require('lsp_extensions').inlay_hints({ enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } })
      end
   }
   use { 'simrat39/rust-tools.nvim' }
   use { 'RishabhRD/popfix' }
   use { 'hood/popui.nvim' }
   use { 'ggandor/lightspeed.nvim' }
   use { 'kyazdani42/nvim-tree.lua' }
   use { 'numToStr/Comment.nvim' }
   use { 'nvim-lualine/lualine.nvim' }
   use { 'j-hui/fidget.nvim' }
   use { 'AckslD/nvim-trevJ.lua' }
   use { 'Mofiqul/vscode.nvim' }

   if packer_bootstrap then
      require('packer').sync()
   end
end)
