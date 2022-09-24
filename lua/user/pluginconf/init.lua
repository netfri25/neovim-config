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
   'oshdff',
}

for _, plugin in ipairs(plugins) do
   local ok, _ = pcall(require, 'user/pluginconf/' .. plugin .. '-conf')
   if not ok then
      print('unable to load ' .. plugin)
   end
end
