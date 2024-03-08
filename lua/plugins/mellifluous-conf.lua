-- Colorscheme

return {
   'ramojus/mellifluous.nvim',
   lazy = false,

   dependencies = {
      'rktjmp/lush.nvim'
   },

   opts = {
      dim_inactive = false,
      neutral = true, -- set this to `true` for neutral background and greys.

      mellifluous = {
         bg_contrast = 'medium',
      },

      styles = {
         comments = { italic = true },
         conditionals = {},
         folds = {},
         loops = {},
         functions = {},
         keywords = {},
         strings = {},
         variables = {},
         numbers = {},
         booleans = {},
         properties = {},
         types = {},
         operators = {},
      },

      transparent_background = {
         enabled = false,
         floating_windows = false,
         telescope = true,
         file_tree = true,
         cursor_line = true,
         status_line = false,
      },

      plugins = {
         cmp = true,
         indent_blankline = false,
         startify = false,

         nvim_tree = {
            enabled = false,
            show_root = false,
         },

         telescope = {
            enabled = false,
            nvchad_like = false,
         },
      },
   }
}
