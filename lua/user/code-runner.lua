-- TODO: dump everything in a config file on a given command

-- dictionary from a filetype into a command
local compile_command = {
   rust = 'cargo build',
   c = 'gcc {file} -o {noext}',
   python = 'nyancat',
}

local run_command = {
   rust = '~/.cargo-build/debug/{rusty}',
   c = './{noext}',
   python = 'python {filepath}',
}

local expansions = {
   filepath = '%',
   fullpath = '%:p',
   file = '%:t',
   noext = '%:r',
   ext = '%:e',
   rusty = '%:p:h:h:t'
}

local function parse_command(command)
   if not command then
      print("TODO: let the user pick a new command")
      return command
   end

   command = command:gsub('{(%w+)}', function(to_expaned)
      local expansion = expansions[to_expaned]
      if not expansion then print('TODO: report an error to the user') end
      return vim.fn.expand(expansion)
   end)

   return command
end

local function create_window()
   local buf_id = vim.api.nvim_create_buf(false, true)
   local width = vim.api.nvim_win_get_width(0)
   local height = vim.api.nvim_win_get_height(0)
   local win_w = vim.fn.floor(0.8 * width)
   local win_h = vim.fn.floor(0.8 * height)
   local win_options = {
      width = win_w,
      height = win_h,
      relative = 'win',
      border = 'rounded',
      style = 'minimal',
      row = vim.fn.floor((height - win_h) / 2),
      col = vim.fn.floor((width - win_w) / 2),
   }
   local win_id = vim.api.nvim_open_win(buf_id, true, win_options)
   vim.api.nvim_create_autocmd('WinClosed', {
      buffer = buf_id,
      command = 'bd!',
   })
   return win_id
end

local function execute_command(win_id, command)
   local full_command = "echo '[" .. command .. "]' && " .. command
   -- local name = command:sub(1, command:find(' '))
   local buf_id = vim.api.nvim_win_get_buf(win_id)
   local to_execute = 'edit term://' .. full_command
   vim.fn.win_execute(win_id, to_execute, true)
   vim.bo.filetype = 'CodeRunner'
   vim.api.nvim_win_set_option(win_id, 'winblend', vim.g.neovide and 30 or 0)
   vim.keymap.set('n', 'q', '<cmd>bdelete!<cr>', { buffer = true })
   vim.api.nvim_buf_set_option(buf_id, 'bufhidden', 'hide')
   -- vim.cmd[[file something]]
   -- vim.api.nvim_buf_set_name(buf_id, "something")
end

local function compile()
   local filetype = vim.bo.filetype
   local command = compile_command[filetype]
   command = parse_command(command)
   local win_id = create_window()
   execute_command(win_id, command)
end

local function run()
   local filetype = vim.bo.filetype
   local command = run_command[filetype]
   command = parse_command(command)
   local win_id = create_window()
   execute_command(win_id, command)
end

local function compile_and_run()
   local filetype = vim.bo.filetype
   local compile_cmd = compile_command[filetype]
   compile_cmd = parse_command(compile_cmd)
   local run_cmd = run_command[filetype]
   run_cmd = parse_command(run_cmd)
   local win_id = create_window()
   local command = compile_cmd .. ' && ' .. run_cmd
   execute_command(win_id, command)
end

vim.keymap.set('n', '<leader>r', compile_and_run, { desc = 'Compile and Run the code inside the buffer' })
vim.keymap.set('n', '<leader>rr', run, { desc = 'Run the code inside the buffer' })
vim.keymap.set('n', '<leader>rc', compile, { desc = 'Compile the code inside the buffer' })
