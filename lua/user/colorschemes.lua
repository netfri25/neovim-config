vim.g.material_style = 'darker' -- Gruvbox material style

local function apply_colorscheme(name, change_cursorline)
   vim.api.nvim_command('colorscheme ' .. name)
   vim.api.nvim_set_hl(0, 'CursorLine', {})
   if change_cursorline == true then
      vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
   end
end

local function func_colorscheme(name, change_cursorline)
   return function()
      apply_colorscheme(name, change_cursorline)
   end
end

-- for easy switching between colorschemes and applying the cursor highlighters
vim.api.nvim_create_user_command('Gruvbox', func_colorscheme('gruvbox-material', true), {})
vim.api.nvim_create_user_command('VSCode', func_colorscheme('vscode', true), {})
vim.api.nvim_create_user_command('Onedark', func_colorscheme('onedark', false), {})
vim.api.nvim_create_user_command('Sublime', func_colorscheme('ofirkai', false), {})

-- might add something in the future that will remember the last colorscheme I used
local colorscheme_cmd = 'Onedark'

vim.api.nvim_command(colorscheme_cmd)
