-- do a treesitter action on some node

return {
   'ckolkey/ts-node-action',
   lazy = true,

   dependencies = { 'nvim-treesitter' },

   keys = {
      { '<leader>a', function() require('ts-node-action').node_action() end, desc = 'Trigger node action' }
   },

   config = true,
}
