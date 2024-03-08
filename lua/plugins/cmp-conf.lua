-- Completion plugin
-- autocompletes from the current buffer, lsp, file in path etc

return {
   'hrsh7th/nvim-cmp',
   lazy = false,

   dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
   },

   config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      vim.keymap.set('i', '<s-tab>', luasnip.expand_or_jump, { expr = true, silent = true })

      local function toggle_window()
         if cmp.visible() then
            cmp.abort()
         else
            cmp.complete()
         end
      end

      cmp.setup({
         snippet = {
            expand = function(args)
               require('luasnip').lsp_expand(args.body)
            end
         },

         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },

         mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),

            ['<C-Space>'] = cmp.mapping({
               i = toggle_window,
               c = toggle_window,
            }),
         }),

         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'path' },
         }, {
            { name = 'buffer' }
         }),

         -- ghost text is cool
         experimental = {
            ghost_text = true,
         },

         formatting = {
            format = function(_, vim_item)
               vim_item.menu = nil
               return vim_item
            end,
         },
      })

      cmp.setup.cmdline('/', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'buffer' }
         }
      })

      cmp.setup.cmdline(':', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'path' }
         }, {
            { name = 'cmdline' }
         })
      })
   end
}
