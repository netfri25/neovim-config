-- simple plugin for split/join brackets

return {
   'echasnovski/mini.splitjoin',
   keys = 'gs',
   lazy = true,
   opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      -- Created for both Normal and Visual modes.
      mappings = {
         toggle = 'gs',
         split = '',
         join = '',
      },

      -- Detection options: where split/join should be done
      detect = {
         -- Array of Lua patterns to detect region with arguments.
         -- Default: { '%b()', '%b[]', '%b{}' }
         brackets = {
            '%b()',
            '%b[]',
            '%b{}'
         },

         -- String Lua pattern defining argument separator
         separator = ',',

         -- Array of Lua patterns for sub-regions to exclude separators from.
         -- Enables correct detection in presence of nested brackets and quotes.
         -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
         exclude_regions = { '%b()', '%b[]', '%b{}', '%b""', "%b''" },
      },

      -- Split options
      split = {
         hooks_pre = {},
         hooks_post = {},
      },

      -- Join options
      join = {
         hooks_pre = {},
         hooks_post = {},
      },
   }
}
