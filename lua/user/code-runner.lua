-- TODO: dump everything in a config file on a given command

-- dictionary from a filetype into a command
local compile_command = {
   rust = 'cargo build',
   c = 'gcc {file} -o {noext}',
   python = 'nyancat',
}

local run_command = {
   rust = 'cargo run',
   c = './{noext}',
   python = 'python {filepath}',
}

local expansions = {
   filepath = '%',
   fullpath = '%:p',
   file = '%:t',
   noext = '%:r',
   ext = '%:e',
}

local function get_command(command)
   command = command:gsub('{(%w+)}', function(to_expaned)
      local expansion = expansions[to_expaned]
      if not expansion then print('TODO: report an error to the user') end
      return vim.fn.expand(expansion)
   end)

   return command
end

local function create_window()
   local buf_id = vim.api.nvim_create_buf(true, true)
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
   return win_id
end

local function execute_command(command)
   if not command then
      print('TODO: prompt the user to pick a new command')
      return
   end

   command = get_command(command)
   local full_command = "echo [" .. command .. "] && " .. command
   local name = command:sub(1, command:find('%s'))
   local win_id = create_window()
   local buf_id = vim.api.nvim_win_get_buf(win_id)
   vim.fn.win_execute(win_id, 'edit term://' .. full_command, true)
   vim.api.nvim_buf_set_name(buf_id, name)
   vim.api.nvim_win_set_option(win_id, 'winblend', vim.g.neovide and 30 or 0)
   vim.keymap.set('n', 'q', '<cmd>bdelete!<cr>', { buffer = true })
end

local function compile()
   local filetype = vim.bo.filetype
   local command = compile_command[filetype]
   execute_command(command)
end

local function run()
   local filetype = vim.bo.filetype
   local command = run_command[filetype]
   execute_command(command)
end

vim.keymap.set('n', '<leader>rr', run, { desc = 'Run the code inside the buffer' })
vim.keymap.set('n', '<leader>rc', compile, { desc = 'Compile the code inside the buffer' })
