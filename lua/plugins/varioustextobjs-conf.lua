return {
   'chrisgrieser/nvim-various-textobjs',
   lazy = false,

   config = function()
      local textobjs = require('various-textobjs')

      textobjs.setup({ useDefaultKeymaps = false })

      -- Value
      vim.keymap.set({ 'o', 'x' }, 'iv', function() textobjs.value("inner") end)
      vim.keymap.set({ 'o', 'x' }, 'av', function() textobjs.value("outer") end)

      -- Key
      vim.keymap.set({ 'o', 'x' }, 'ik', function() textobjs.key("inner") end)
      vim.keymap.set({ 'o', 'x' }, 'ak', function() textobjs.key("outer") end)

      -- Subword
      vim.keymap.set({ 'o', 'x' }, 'is', function() textobjs.subword("inner") end)
      vim.keymap.set({ 'o', 'x' }, 'as', function() textobjs.subword("outer") end)

      -- Chain Member
      vim.keymap.set({ 'o', 'x' }, 'im', function() textobjs.chainMember("inner") end)
      vim.keymap.set({ 'o', 'x' }, 'am', function() textobjs.chainMember("outer") end)

      -- Url
      vim.keymap.set({ 'o', 'x' }, 'as', function() textobjs.url() end)

      -- Entire buffer
      vim.keymap.set({ 'o', 'x' }, 'gG', function() textobjs.entireBuffer() end)
   end
}
