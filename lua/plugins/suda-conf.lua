-- another gigantic configuration file with a lot of effort put into it
-- lets me write files using sudo
return {
   'lambdalisue/suda.vim',
   lazy = true,
   cmd = { 'SudaRead', 'SudaWrite' },

   config = function()
      vim.g.suda_smart_edit = 1
   end
}
