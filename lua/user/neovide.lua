-- vim.g.neovide_cursor_vfx_mode = 'ripple'
vim.g.neovide_refresh_rate = 60
vim.g.neovide_fullscreen = true
vim.g.neovide_no_idle = false
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_scroll_animation_length = 0.17
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
vim.g.neovide_profiler = false
vim.g.neovide_remember_window_size = true

vim.g.gui_font_default_size = 11
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = 'Iosevka Custom'
vim.g.gui_antialiasing = 'antialias'
vim.g.gui_hinting = 'normal'

RefreshGuiFont = function()
   vim.opt.guifont = string.format(
      '%s:h%s:#e-%s:#h-%s',
      vim.g.gui_font_face,
      vim.g.gui_font_size,
      vim.g.gui_antialiasing,
      vim.g.gui_hinting
   )
end

ResizeGuiFont = function(delta)
   vim.g.gui_font_size = vim.g.gui_font_size + delta
   RefreshGuiFont()
end

ResetGuiFont = function()
   vim.g.gui_font_size = vim.g.gui_font_default_size
   RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps
vim.keymap.set({ 'n', 'i', 'v' }, '<C-=>', function() ResizeGuiFont(1) end, { silent = true, desc = 'Decrease GUI font size' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-->', function() ResizeGuiFont(-1) end, { silent = true, desc = 'Increase GUI font size' })
