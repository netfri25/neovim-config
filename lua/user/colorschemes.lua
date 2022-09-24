vim.g.material_style = 'darker' -- Gruvbox material style
vim.g.onedark_config = { style = 'warm' }

local function apply_colorscheme(name)
   vim.api.nvim_command('colorscheme ' .. name)
   vim.api.nvim_set_hl(0, 'CursorLine', {})
   vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
end

local function func_colorscheme(name)
   return function()
      apply_colorscheme(name)
   end
end

-- for easy switching between colorschemes and applying the cursor highlighters
vim.api.nvim_create_user_command('Gruvbox', func_colorscheme('gruvbox-material'), {})
vim.api.nvim_create_user_command('VSCode', func_colorscheme('vscode'), {})
vim.api.nvim_create_user_command('Onedark', func_colorscheme('onedark'), {})

-- might add something in the future that will remember the last colorscheme I used
local colorscheme_cmd = 'Gruvbox'

vim.api.nvim_command(colorscheme_cmd)
