local ok, revj = pcall(require, "revj")
if not ok then return end

revj.setup({
   brackets = {first = '([{<', last = ')]}>'}, -- brackets to consider surrounding arguments
   new_line_before_last_bracket = true, -- add new line between last argument and last bracket (only if no last seperator)
   add_seperator_for_last_parameter = false, -- if a seperator should be added if not present after last parameter
   enable_default_keymaps = false, -- enables default keymaps without having to set them below
   keymaps = {
      operator = '<leader>J', -- for operator (+motion)
      line = '<leader>j', -- for formatting current line
      visual = '<leader>j', -- for formatting visual selection
   },
   parameter_mapping = ',', -- specifies what text object selects an arguments (ie a, and i, by default)
     -- if you're using `vim-textobj-parameter` you can also set this to `vim.g.vim_textobj_parameter_mapping`
})
