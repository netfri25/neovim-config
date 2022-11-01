local ok, tree = pcall(require, 'nvim-tree')
if not ok then return end

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', { silent = true, desc = 'Toggle file browser' })

tree.setup({
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	sync_root_with_cwd = true,

	filters = {
		dotfiles = false,
		custom = { '^.git$', '^.gitignore$', '^target$' },
	},

	actions = {
		use_system_clipboard = false,

		open_file = {
			quit_on_open = true,
		},

		file_popup = {
			open_win_config = {
				relative = 'cursor',
				border = 'rounded',
				style = 'minimal',
			},
		},
	},

	view = {
		number = false,
		relativenumber = false,
		adaptive_size = true,
		mappings = {
			custom_only = true,
			list = {
				{ key = '<cr>', action = 'toggle_node' },
				{ key = 'i', action = 'edit' },
				{ key = '<C-i>', action = 'edit_in_place' },
				{ key = { '\\', 'l' }, action = 'cd' },
				{ key = '<C-v>', action = 'vsplit' },
				{ key = '<C-s>', action = 'split' },
				{ key = '<', action = 'prev_sibling' },
				{ key = '>', action = 'next_sibling' },
				{ key = 'P', action = 'parent_node' },
				{ key = '<bs>', action = 'close_node' },
				{ key = '<tab>', action = 'preview' },
				{ key = 'K', action = 'first_sibling' },
				{ key = 'J', action = 'last_sibling' },
				{ key = 'I', action = 'toggle_git_ignored' },
				{ key = 'H', action = 'toggle_dotfiles' },
				-- INFO: I don't have any custom hidden files (yet), so rn its commented out
				{ key = 'U', action = 'toggle_custom' },
				{ key = 'R', action = 'refresh' },
				{ key = 'a', action = 'create' },
				{ key = 'd', action = 'remove' },
				{ key = 'r', action = 'rename' },
				{ key = '<C-r>', action = 'full_rename' },
				{ key = 'x', action = 'cut' },
				{ key = 'c', action = 'copy' },
				{ key = 'p', action = 'paste' },
				{ key = 'y', action = 'copy_name' },
				{ key = 'Y', action = 'copy_path' },
				{ key = 'gy', action = 'copy_absolute_path' },
				{ key = '[d', action = 'prev_diag_item' },
				{ key = ']d', action = 'next_diag_item' },
				{ key = '[g', action = 'prev_git_item' },
				{ key = ']g', action = 'next_git_item' },
				{ key = { 'h', '-' }, action = 'dir_up' },
				-- INFO: I'm not using these because I don't want it to override
				--		 the keymaps for the lightspeed plugin
				-- { key = 's', action = 'system_open' },
				-- { key = 'S', action = 'search_node' },

				-- INFO: filters are really bad.
				--		 If its not going to get an update which fixes most of its bugs
				--		 and makes them look nicer I will just keep using the default
				--		 buffer search or the lightspeed plugin
				-- { key = 'f', action = 'live_filter' },
				-- { key = 'F', action = 'clear_live_filter' },
				{ key = { 'q', '<esc>' }, action = 'close' },
				{ key = 'E', action = 'collapse_all' },
				{ key = 'e', action = 'expand_all' },
				{ key = '.', action = 'run_file_command' },
				{ key = '<c-k>', action = 'toggle_file_info' },
				{ key = '?', action = 'toggle_help' },
				{ key = 'mm', action = 'toggle_mark' },
				{ key = 'mv', action = 'bulk_move' },
			}
		},

		-- keeping this if I would ever want to go back into floating window
		float = {
			enable = false,
			open_win_config = {
				relative = 'editor',
				border = 'rounded',
				width = 35,
				height = 20,
			},
		},
	},

	renderer = {
		icons = {
			show = {
				file = true,
				-- the folder icon is very useless
				folder = false,
				folder_arrow = true,
				git = true,
			},
		},
	},

	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},

	-- I'm not using it anymore, but I will if its going to improve
	live_filter = {
		always_show_folders = false,
	},
})
