-- discord presence plugin

local function fix_repo_url(url)
   return url:gsub('git@github.com:', 'https://github.com/', 1)
end

local function buttons(_, repo_url)
   local t = { { label = 'Check out this cute dog!', url = 'https://youtu.be/SHRAEqxoN0c' } }
   if repo_url then
      table.insert(t, { label = 'View repository', url = fix_repo_url(repo_url) })
   end
   return t
end

return {
   'andweeb/presence.nvim',
   lazy = false,
   priority = 500,
   opts = {
      auto_update = true,
      neovim_image_text = 'We\'re no stranges to love\nYou know the rules and so do I',
      main_image = 'file',
      client_id = '793271441293967371',
      log_level = nil,
      debounce_time = 10,
      enable_line_number = false,
      blacklist = {},
      buttons = buttons,

      file_assets = {},

      editing_text        = 'Editing %s',
      file_explorer_text  = 'Browsing %s',
      git_commit_text     = 'Committing changes',
      plugin_manager_text = 'Managing plugins',
      reading_text        = 'Reading %s',
      workspace_text      = 'Working on %s',
      line_number_text    = 'Line %s out of %s',
   }
}
