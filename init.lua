-- load this at the very start, for better performance
pcall(require, 'user/impatient-conf')

require('packer-startup')
require('user/options')
require('user/keymaps')
require('user/commands')
require('user/neovide')
require('user/pluginconf')
require('user/colorschemes')
