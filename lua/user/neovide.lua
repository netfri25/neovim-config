-- vim.g.neovide_cursor_vfx_mode = 'ripple'
-- vim.g.neovide_refresh_rate = 120
vim.g.neovide_fullscreen = true
vim.g.neovide_input_use_logo = true
vim.g.neovide_no_idle = false
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_scroll_animation_length = 0.2
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_cursor_trail_size = 0.6
vim.g.neovide_cursor_animation_length = 0.07
vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
-- vim.g.neovide_profiler = true

vim.g.gui_font_default_size = 15
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = 'Iosevka Custom'
vim.g.gui_antialiasing = 'subpixelantialias'
vim.g.gui_hinting = 'normal'

RefreshGuiFont = function()
   vim.opt.guifont = string.format('%s:h%s:#e-%s:#h-%s', vim.g.gui_font_face, vim.g.gui_font_size, vim.g.gui_antialiasing, vim.g.gui_hinting)
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
vim.keymap.set({ 'n', 'i', 'v' }, '<C-=>', function() ResizeGuiFont(2) end, { silent = true, desc = 'Decrease GUI font size' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-->', function() ResizeGuiFont(-2) end, { silent = true, desc = 'Increase GUI font size' })
