local plugins = {
   'impatient',
   'presence',
   'suda',
   'whichkey',
   'toggleterm',
   'comment',
   'treesitter',
   'whitespace',
   'cmp',
   'lsp',
   'popui',
   'luasnip',
   'lightspeed',
   'tree',
   'lualine',
   'fidget',
   'trevj',
   'vscode',
}

for _, plugin in ipairs(plugins) do
   local ok, err = pcall(require, 'user/pluginconf/' .. plugin .. '-conf')
   if not ok then
      vim.api.nvim_err_writeln('unable to load ' .. plugin .. ': ' .. err)
   end
end
