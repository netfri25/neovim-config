return {
   'nvim-lua/lsp_extensions.nvim',
   build = function()
      require('lsp_extensions').inlay_hints({ enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } })
   end
}
