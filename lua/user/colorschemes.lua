vim.g.material_style = 'darker' -- Gruvbox material style

local function apply_colorscheme(name, change_cursorline)
   vim.api.nvim_command('colorscheme ' .. name)
   vim.api.nvim_set_hl(0, 'CursorLine', {})
   vim.api.nvim_set_hl(0, 'FloatBorder', {})

   if change_cursorline then
      vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
   end
end

local function create_colorscheme_command(command_name, name, change_cursorline)
   local function func()
      apply_colorscheme(name, change_cursorline)
   end

   vim.api.nvim_create_user_command(command_name, func, {})
end

vim.api.nvim_create_autocmd('ColorScheme', {
   callback = function()
      vim.api.nvim_set_hl(0, 'CursorLine', {})
   end
})

create_colorscheme_command('MelioraT', 'mellifluous', true)

-- might add something in the future that will remember the last colorscheme I used
local default_colorscheme = 'MelioraT'

vim.api.nvim_command(default_colorscheme)
