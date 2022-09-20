local ok, presence = pcall(require, "presence")
if not ok then return end

presence:setup({
   auto_update = true,
   neovim_image_text = "We're no stranges to love\nYou know the rules and so do I",
   main_image = "neovim",
   client_id = "793271441293967371",
   log_level = nil,
   debounce_time = 10,
   enable_line_number = false,
   blacklist = {},
   buttons = {{ label = "Check out this cute dog!", url = "https://rr.noordstar.me/0ee63750" }},

   file_assets = {},

   editing_text        = "Editing %s",
   file_explorer_text  = "Browsing %s",
   git_commit_text     = "Committing changes",
   plugin_manager_text = "Managing plugins",
   reading_text        = "Reading %s",
   workspace_text      = "Working on %s",
   line_number_text    = "Line %s out of %s",
})
