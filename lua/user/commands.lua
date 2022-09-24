vim.cmd([[
   let @/=""

   " custom files
   au BufRead,BufNewFile *.jva set filetype=java
   au BufRead,BufNewFile *.ktn set filetype=kitten

   " custom file settings
   autocmd Filetype haskell setlocal shiftwidth=2 softtabstop=2
   autocmd FileType json syntax match Comment +\/\/.\+$+

   " custom commands
   function! OpenConfig()
      edit /home/netfri/.config/nvim/init.lua
   endfunction
   command! Config call OpenConfig()

   function! OpenPlugins()
      edit /home/netfri/.config/nvim/lua/plugins.lua
   endfunction
   command! Plugins call OpenPlugins()

   function OpenLspConfig()
      edit /home/netfri/.config/nvim/lua/pluginconf/lsp-conf.lua
   endfunction
   command! LspConfig call OpenLspConfig()

   function OpenNVimDir()
      edit /home/netfri/.config/nvim
   endfunction
   command! NVDir call OpenNVimDir()

   function ReloadConfig()
      source /home/netfri/.config/nvim/init.lua
   endfunction
   command! Reload call ReloadConfig()

   " save and load folds
   " augroup remember_folds
   "   autocmd!
   "   au BufWinLeave ?* silent! mkview 1
   "   au BufWinEnter ?* silent! loadview 1
   " augroup END

   " set viewoptions-=options

   augroup highlight_yank
       autocmd!
       au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
   augroup END
]])
