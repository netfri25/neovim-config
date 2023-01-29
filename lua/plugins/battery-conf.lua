return {
   'justinhj/battery.nvim',
   --
    -- also needs 'acpi' installed
   dependencies = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
   },

   opts = {
      update_rate_seconds = 30, -- Number of seconds between checking battery status
      show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
      show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
      show_unplugged_icon = false, -- When true show a diconnected cable icon when not plugged in
      show_percent = true, -- Whether or not to show the percent charge remaining in digits
      vertical_icons = true, -- When true icons are vertical, otherwise shows horizontal battery icon
      multiple_battery_selection = 'max',
   }
}
