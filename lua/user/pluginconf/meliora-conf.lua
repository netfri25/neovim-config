local ok, meliora = pcall(require, 'meliora')
if not ok then return end

meliora.setup({
   dim_inactive = false,
   neutral = true, -- set this to `true` for neutral background and greys.

   styles = {
      comments = 'italic',
      conditionals = 'NONE',
      folds = 'NONE',
      loops = 'NONE',
      functions = 'NONE',
      keywords = 'NONE',
      strings = 'NONE',
      variables = 'NONE',
      numbers = 'NONE',
      booleans = 'NONE',
      properties = 'NONE',
      types = 'NONE',
      operators = 'NONE',
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
      startify = true,

      nvim_tree = {
         enabled = true,
         show_root = true,
      },

      telescope = {
         enabled = false,
         nvchad_like = true,
      },
   },
})
