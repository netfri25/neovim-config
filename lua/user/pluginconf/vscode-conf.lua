-- I don't like this theme anyway but its nice for "trolling" people that I use VSCode
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
