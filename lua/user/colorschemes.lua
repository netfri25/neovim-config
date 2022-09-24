vim.g.material_style = 'darker'
vim.g.onedark_config = { style = 'warm' }

local function apply_colorscheme(name)
   vim.api.nvim_command('colorscheme ' .. name)
   vim.cmd [[ highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE ]]
end

local function func_colorscheme(name)
   return function()
      apply_colorscheme(name)
   end
end

vim.api.nvim_create_user_command('Gruvbox', func_colorscheme('gruvbox-material'), {})
vim.api.nvim_create_user_command('VSCode', func_colorscheme('vscode'), {})
vim.api.nvim_create_user_command('Onedark', func_colorscheme('onedark'), {})

local colorscheme_cmd = 'Gruvbox'

vim.api.nvim_command(colorscheme_cmd)
