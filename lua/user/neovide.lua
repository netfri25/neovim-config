vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_refresh_rate = 150
vim.g.neovide_fullscreen = true
vim.g.neovide_input_use_logo = true
vim.g.neovide_no_idle = true
-- vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_scroll_animation_length = 0.8
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_cursor_trail_length = 0.01
vim.g.neovide_cursor_animation_length = 0.07
vim.g.neovide_cursor_vfx_particle_lifetime = 0.8

vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMonoNL Nerd Font"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
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
local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-=>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)