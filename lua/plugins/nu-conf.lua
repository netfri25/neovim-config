-- small support for nushell script files

return {
   'LhKipp/nvim-nu',
   lazy = true,
   ft = 'nu',
   keys = {{ 'K', vim.lsp.buf.hover, silent = true, buffer = true }},
   config = function()
      require('nu').setup({ use_lsp_features = false })
   end
}
