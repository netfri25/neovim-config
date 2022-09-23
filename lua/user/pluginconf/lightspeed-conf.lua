local ok, lightspeed = pcall(require, 'lightspeed')
if not ok then return end

lightspeed.setup({
   ignore_case = true,
   exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
   --- s/x ---
   jump_to_unique_chars = false,
   match_only_the_start_of_same_char_seqs = true,
   force_beacons_into_match_width = true,
   special_keys = {
      next_match_group = '<tab>',
      prev_match_group = '<s-tab>',
   },
   --- f/t ---
   limit_ft_matches = 4,
   repeat_ft_with_target_char = false,
})
