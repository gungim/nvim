local M = {}
local icons = require("gungim.icons")

M.config = function()
	local function on_attach(bufnr)
		local api = require("nvim-tree.api")
		local preview = require("nvim-tree-preview")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
		-- Default mappings. Feel free to modify or remove as you wish.
		--
		-- BEGIN_DEFAULT_ON_ATTACH
		local userful_keys = {
			["<C-v>"] = { api.node.open.vertical, opts("Open: Vertical Split") },
			["<C-x>"] = { api.node.open.horizontal, opts("Open: Horizontal Split") },
			["a"] = { api.fs.create, opts("Create") },
			["c"] = { api.fs.copy.node, opts("Copy") },
			["d"] = { api.fs.remove, opts("Delete") },
			["e"] = { api.fs.rename_basename, opts("Rename: Basename") },
			["H"] = { api.tree.toggle_hidden_filter, opts("Toggle Dotfiles") },
			["o"] = { api.node.open.edit, opts("Open") },
			["p"] = { api.fs.paste, opts("Paste") },
			["r"] = { api.fs.rename, opts("Rename") },
			["R"] = { api.tree.reload, opts("Refresh") },
			["S"] = { api.tree.search_node, opts("Search") },
			["x"] = { api.fs.cut, opts("Cut") },
			["y"] = { api.fs.copy.filename, opts("Copy Name") },
			["Y"] = { api.fs.copy.relative_path, opts("Copy Relative Path") },
			["l"] = { api.node.open.edit, opts("Open") },
			["<CR>"] = { api.node.open.edit, opts("Open") },
			["h"] = { api.node.navigate.parent_close, opts("Close Directory") },
			["v"] = { api.node.open.vertical, opts("Open: Vertical Split") },
			["P"] = { preview.watch, opts("Preview (Watch)") },
			["<Esc>"] = { preview.unwatch, opts("Close Preview/Unwatch") },
			["<Tab>"] = { preview.node_under_cursor, opts("Preview") },
		}

		require("gungim.config.keymaps").load_mode("n", userful_keys)
	end

	GG.builtin.nvim_tree = {
		on_config_done = nil,
		on_attach = on_attach,
		auto_reload_on_write = false,
		reload_on_bufenter = true,
		root_dirs = { "Root" },
		filters = {
			-- custom = { ".git", "node_modules", "\\.cache" },
			exclude = { ".gitignore" },
		},
		renderer = {
			highlight_git = true,
			root_folder_label = function(path)
				return " " .. vim.fn.fnamemodify(path, ":t")
			end,

			indent_markers = {
				enable = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
			icons = {
				web_devicons = {
					folder = {
						enable = true,
						color = true,
					},
				},
				git_placement = "after",
				show = {
					folder_arrow = false,
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
			side = "left",
			number = true,
			relativenumber = true,
			centralize_selection = false,
		},
		actions = {
			change_dir = {
				enable = true,
				global = true,
				restrict_above_cwd = false,
			},
			expand_all = {
				max_folder_discovery = 300,
				exclude = {},
			},
		},
		filesystem_watchers = {
			enable = true,
		},
	}
end

M.setup = function()
	local status_ok, nvim_tree = pcall(require, "nvim-tree")
	if not status_ok then
		return
	end

	nvim_tree.setup(GG.builtin.nvim_tree)

	if GG.builtin.nvim_tree.on_config_done then
		GG.builtin.on_config_done(nvim_tree)
	end
end
return M

-- function(path)
-- 			return " " .. vim.fn.fnamemodify(path, ":t")
-- 		end,
