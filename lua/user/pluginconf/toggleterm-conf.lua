local ok, toggleterm = pcall(require, "toggleterm")
if not ok then return end

toggleterm.setup({
   size = 20,
   open_mapping = [[<c-\>]],
   hide_numbers = true,
   shade_filetypes = {},
   shade_terminal = true,
   shading_factor = 2,
   start_in_insert = true,
   insert_mapping = true,
   persist_size = true,
   direction = "float",
   close_on_exit = true,
   shell = "/usr/bin/fish",
   float_opts = {
      border = 'curved',
      winblend = 0,
      highlightes = {
         border = "Normal",
         background = "Normal"
      }
   }
})
