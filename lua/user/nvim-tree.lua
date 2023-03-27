local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end


local icons = require "user.icons"

local tree_cb = nvim_tree_config.nvim_tree_callback
local function open_nvim_tree()
	-- open the tree
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

nvim_tree.setup {
	auto_reload_on_write = true,
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore" },
	},
	update_cwd = true,
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = icons.documents.File,
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = icons.documents.Folder,
					open = icons.documents.OpenFolder,
					empty = icons.documents.Folder,
					empty_open = icons.documents.OpenFolder,
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = { "toggleterm" },
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 50,
		hide_root_folder = false,
		side = "left",
		-- auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>" }, cb = tree_cb "edit" },
				{ key = "h",             cb = tree_cb "close_node" },
				{ key = "v",             cb = tree_cb "vsplit" },
			},
		},
		number = true,
		relativenumber = true,
	},
	actions = {
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
	},
	filesystem_watchers = {
		enable = true
	}
}
