local ok, vscode = pcall(require, 'vscode')
if not ok then return end

local c = require('vscode.colors')

vscode.setup({
   transparent = false,
   italic_comments = true,
   disable_nvimtree_bg = true,
   color_overrides = { vscLineNumber = '#FFFFFF' },
   group_overrides = {
      Cursor = {
         fg = c.vscDarkBlue,
         bg = c.vscLightGreen,
         bold = true,
      },
   }
})

function VSCode()
   vim.cmd[[
      colorscheme vscode
      highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
   ]]
end
vim.api.nvim_create_user_command('VSCode', 'lua VSCode()', {})

function Gruvbox()
   vim.cmd[[
      colorscheme gruvbox-material
      highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
   ]]
end

vim.api.nvim_create_user_command('Gruvbox', 'lua Gruvbox()', {})
