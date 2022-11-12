if not package.loaded.packer then
   vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = 'plugins.lua',
      command = 'so ~/.config/nvim/lua/plugins.lua | so ~/.config/nvim/lua/packer-startup.lua',
   })
else
   package.loaded.packer = nil
   package.loaded.plugins = nil
end

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
local packer = require('packer')

local plugins = require('plugins')

return packer.startup(function(use)
   for _, plugin in ipairs(plugins) do
      use(plugin)
   end

   if packer_bootstrap then
      packer.sync()
   end
end)
