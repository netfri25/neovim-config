return {
   'chrisgrieser/nvim-various-textobjs',
   lazy = false,
   config = function()
      local textobjs = require('various-textobjs')

      textobjs.setup({ useDefaultKeymaps = false })

      -- Indentation
      vim.keymap.set({ 'o', 'x' }, 'ii', function() textobjs.indentation(true, true) end)
      vim.keymap.set({ 'o', 'x' }, 'ai', function() textobjs.indentation(false, true) end)
      vim.keymap.set({ 'o', 'x' }, 'aI', function() textobjs.indentation(false, false) end)
      vim.keymap.set({ 'o', 'x' }, 'iI', function() textobjs.indentation(true, false) end)

      -- Value
      vim.keymap.set({ 'o', 'x' }, 'iv', function() textobjs.value(true) end)
      vim.keymap.set({ 'o', 'x' }, 'av', function() textobjs.value(false) end)

      -- Key
      vim.keymap.set({ 'o', 'x' }, 'ik', function() textobjs.key(true) end)
      vim.keymap.set({ 'o', 'x' }, 'ak', function() textobjs.key(false) end)

      -- Number
      vim.keymap.set({ 'o', 'x' }, 'in', function() textobjs.number(true) end)
      vim.keymap.set({ 'o', 'x' }, 'an', function() textobjs.number(false) end)

      -- Subword
      vim.keymap.set({ 'o', 'x' }, 'is', function() textobjs.subword(true) end)
      vim.keymap.set({ 'o', 'x' }, 'as', function() textobjs.subword(false) end)

      -- Entire buffer
      vim.keymap.set({ 'o', 'x' }, 'gG', function() textobjs.entireBuffer() end)
   end
}
