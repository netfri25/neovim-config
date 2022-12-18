local ok, tree = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

tree.setup({
   ensure_installed = {
      'c',
      'cpp',
      'vim',
      'lua',
      'rust',
      'java',
      'toml',
      'json',
      'fish',
      'help',
      'ocaml',
      'python',
      'haskell',
      'markdown',
      'git_rebase',
      'gitattributes',
      'gitcommit',
   },

   sync_install = false,
   auto_install = true,
   ignore_install = { 'phpdoc' },

   highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
   },

   -- indent = {
   --    enable = true,
   -- },
})
