return {
   'simrat39/rust-tools.nvim',

   ft = 'rust',

   dependencies = {
      'neovim/nvim-lspconfig',
   },

   opts = {
      tools = {
         autoSetHints = true,
         inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = '<- ',
            other_hints_prefix = '=> ',
            highlight = 'Conceal',
         },
      },

      server = {
         cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
         -- capabilities = capabilities,

         settings = {
            ['rust-analyzer'] = {
               checkOnSave = {
                  command = 'clippy',

                  inlayHints = {
                     maxLength = 'null',
                  },
               },
            },
         },
      },
   }
}
