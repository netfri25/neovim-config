return {
   'ckolkey/ts-node-action',
   dependencies = { 'nvim-treesitter' },
   opts = function()
      require('ts-node-action').setup({})
      vim.keymap.set('n', '<leader>a', require('ts-node-action').node_action, { desc = 'Trigger Node Action' })
   end
}
