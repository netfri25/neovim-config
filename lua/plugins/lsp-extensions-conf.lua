return {
   'nvim-lua/lsp_extensions.nvim',
   event = 'VimEnter',
   build = function()
      require('lsp_extensions').inlay_hints({ enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } })
   end
}
