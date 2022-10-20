-- this plugin improves my startup speed.
-- I have no idea how (caching? maybe? I really don't understand how it works) but I love it

_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath('cache') .. '/luacache_chunks',
	},

	modpaths = {
		enable = true,
		path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
	}
}

local ok, _ = pcall(require, 'impatient')
if not ok then return end
