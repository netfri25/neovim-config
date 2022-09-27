local plugins = {
   -- loading this plugin at the very start
   -- 'impatient',
   'presence',
   'suda',
   -- 'whichkey',
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
   'ofirkai',
}

for _, plugin in ipairs(plugins) do
   local ok, err = pcall(require, 'user/pluginconf/' .. plugin .. '-conf')
   if not ok then
      vim.api.nvim_err_writeln('unable to load ' .. plugin .. ': ' .. err)
   end
end
