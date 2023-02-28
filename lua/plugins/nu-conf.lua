return {
   'LhKipp/nvim-nu',
   lazy = false,
   keys = {{ 'n', 'K', vim.lsp.buf.hover, silent = true, buffer = true }},
   config = function()
      require('nu').setup({ use_lsp_features = false })
   end
}
