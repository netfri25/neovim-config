local ok, livecommand = pcall(require, 'live-command')
if not ok then return end

livecommand.setup({
   commands = {
      Norm = { cmd = 'norm' },
   },
})
