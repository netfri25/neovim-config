_G.__luacache_config = {
   chunks = {
      enable = true,
      path = vim.fn.stdpath('cache')..'/luacache_chunks',
   },

   modpaths = {
      enable = true,
      path = vim.fn.stdpath('cache')..'/luacache_modpaths',
   }
}

local ok, impatiant = pcall(require, 'impatient')
