local ok, revj = pcall(require, 'revj')
if not ok then return end

revj.setup({
   brackets = {first = '([{<', last = ')]}>'},
   new_line_before_last_bracket = true,
   add_seperator_for_last_parameter = false,
   enable_default_keymaps = false,
   parameter_mapping = ',',

   keymaps = {
      operator = '<leader>J',
      line = '<leader>j',
      visual = '<leader>j',
   },
})
