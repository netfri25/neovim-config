-- lsp progress mini notifications
local ok, fidget = pcall(require, 'fidget')
if not ok then return end

-- In case I will ever want to change something (which I probably wouldn't but who cares)
fidget.setup({
   sources = {
      hls = {
         ignore = true,
      },
   },
})
