-- kinda like Monokai but more similar to Sublime's Monokai
local ok, ofirkai = pcall(require, 'ofirkai')
if not ok then return end

ofirkai.setup({})
