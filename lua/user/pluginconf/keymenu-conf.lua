local ok, keymenu = pcall(require, 'key-menu')
if not ok then return end

keymenu.set('n', '<space>')
keymenu.set('n', 'g')
