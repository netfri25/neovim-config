local ok, comment = pcall(require, 'Comment')
if not ok then return end

-- nothing really to setup, but incase I will ever want to change stuff in the future
comment.setup({})
