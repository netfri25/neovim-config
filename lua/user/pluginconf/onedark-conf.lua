local ok, onedark = pcall(require, 'onedark')
if not ok then return end

onedark.setup({
   style = 'warm',
   transparent = false,
   term_colors = true,
   ending_tildes = false,
   cmp_itemkind_reverse = false,

   toggle_style_key = nil,
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
   highlights = {},

   diagnostics = {
      darker = true,
      undercurl = false,
      background = true,
   },
})