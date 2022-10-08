local ok, onedark = pcall(require, 'onedark')
if not ok then return end

onedark.setup({
   style = 'warmer',
   transparent = false,
   term_colors = true,
   ending_tildes = false,
   cmp_itemkind_reverse = false,

   -- toggle_style_key = '<c-s>',
   toggle_style_list = { 'dark', 'darker', 'warm', 'warmer', 'deep', 'cool' },

   code_styles = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none',
   },

   lualine = {
      transparent = false,
   },

   colors = {},

   highlights = {
      TSParameter = { fg = '$fg' },
      CursorLineNr = { fg = '$cyan' },

      MatchParen = {
         fg = '$red',
         bg = '#00000000',
         fmt = 'underline,bold',
      },
   },

   diagnostics = {
      darker = true,
      undercurl = false,
      background = true,
   },
})
