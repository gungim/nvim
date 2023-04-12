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
		custom = { ".git", "node_modules", "\\.cache" },
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
			git_placement = "after",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				default = icons.ui.Text,
				bookmark = icons.ui.BookMark,
				symlink = icons.ui.FolderSymlink,
				folder = {
					arrow_closed = icons.ui.TriangleShortArrowRight,
					arrow_open = icons.ui.TriangleShortArrowDown,
					default = icons.ui.Folder,
					open = icons.ui.FolderOpen,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					symlink = icons.ui.FolderSymlink,
					symlink_open = icons.ui.FolderOpen,
				},
				git = {
					unstaged = icons.git.FileUnstaged,
					staged = icons.git.FileStaged,
					unmerged = icons.git.FileUnmerged,
					renamed = icons.git.FileRenamed,
					untracked = icons.git.FileUntracked,
					deleted = icons.git.FileDeleted,
					ignored = icons.git.FileIgnored,
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = icons.diagnostics.BoldHint,
			info = icons.diagnostics.BoldInformation,
			warning = icons.diagnostics.BoldWarning,
			error = icons.diagnostics.BoldError,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = { "toggleterm" },
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
		show_on_dirs = true,
		show_on_open_dirs = true,
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
