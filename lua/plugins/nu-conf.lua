return {
   'LhKipp/nvim-nu',
   lazy = false,
   enabled = vim.loop.os_uname().sysname == "Linux",
   keys = {{ 'K', vim.lsp.buf.hover, silent = true, buffer = true }},
   config = function()
      require('nu').setup({ use_lsp_features = false })
   end
}
