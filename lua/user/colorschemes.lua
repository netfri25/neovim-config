vim.g.material_style = 'darker' -- Gruvbox material style

local function apply_colorscheme(name, change_cursorline)
   vim.api.nvim_command('colorscheme ' .. name)
   vim.api.nvim_set_hl(0, 'CursorLine', {})
   -- doesn't work, I will need to fix it in the future
   -- vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineError', { underline = true, undercurl = false })
   -- vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineWarning', { underline = true, undercurl = false })
   -- vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineInformation', { underline = true, undercurl = false })
   -- vim.api.nvim_set_hl(0, 'LspDiagnosticsUnderlineHint', { underline = true, undercurl = false })
   if change_cursorline then
      vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
   end
end

local function func_colorscheme(command_name, name, change_cursorline)
   local function func()
      apply_colorscheme(name, change_cursorline)
   end

   vim.api.nvim_create_user_command(command_name, func, {})
end

vim.api.nvim_create_autocmd('ColorScheme', {
   callback = function()
      vim.api.nvim_set_hl(0, 'CursorLine', {})
      -- vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'Special' })
   end
})

-- for easy switching between colorschemes and applying the cursor highlighters
-- func_colorscheme('Gruvbox', 'gruvbox-material', true)
-- func_colorscheme('VSCode', 'vscode', true)
-- func_colorscheme('Onedark', 'onedark', false)
-- func_colorscheme('Sublime', 'ofirkai', false)
func_colorscheme('MelioraT', 'mellifluous', true)

-- might add something in the future that will remember the last colorscheme I used
local default_colorscheme = 'MelioraT'

vim.api.nvim_command(default_colorscheme)
