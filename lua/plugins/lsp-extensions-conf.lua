return {
   'nvim-lua/lsp_extensions.nvim',
   lazy = true,
   build = function()
      require('lsp_extensions').inlay_hints({ enabled = { 'TypeHint', 'ChainingHint', 'ParameterHint' } })
   end
}
