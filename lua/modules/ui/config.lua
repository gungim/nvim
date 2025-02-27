local icons = require("core.icons")
local config = {}

function config.theme()
	require("catppuccin").setup()
end

function config.nvim_tree()
	local function on_attach(bufnr)
		local api = require("nvim-tree.api")
		local preview = require("nvim-tree-preview")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
		-- Default mappings. Feel free to modify or remove as you wish.
		api.config.mappings.default_on_attach(bufnr)

		--
		-- BEGIN_DEFAULT_ON_ATTACH
		vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
		vim.keymap.set("n", "a", api.fs.create, opts("Create"))
		vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
		vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
		vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
		vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
		vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
		vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
		vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
		vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
		vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
		vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
		vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
		vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
		vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
		vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
		vim.keymap.set("n", "<Tab>", preview.node_under_cursor, opts("Preview"))
	end
	require("nvim-tree").setup({
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
	})
end

function config.bufferline()
	local function diagnostics_indicator(_, _, diagnostics, _)
		local result = {}
		local symbols = {
			error = icons.diagnostics.Error,
			warning = icons.diagnostics.Warning,
			info = icons.diagnostics.Information,
		}
		for name, count in pairs(diagnostics) do
			if symbols[name] and count > 0 then
				table.insert(result, symbols[name] .. " " .. count)
			end
		end
		local r = table.concat(result, " ")
		return #r > 0 and r or ""
	end
	require("bufferline").setup({
		options = {
			mode = "buffers",
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "none", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			indicator = {
				icon = nil,
				style = "underline",
			},

			buffer_close_icon = icons.ui.BoldClose,
			modified_icon = icons.ui.BoldClose,
			close_icon = icons.ui.BoldClose,
			left_trunc_marker = icons.ui.ArrowCircleLeft,
			right_trunc_marker = icons.ui.ArrowCircleRight,

			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
			update_in_insert = true,
			diagnostics_indicator = diagnostics_indicator,
			offsets = {
				{
					filetype = "NvimTree",
					text = function()
						return vim.fn.getcwd()
					end,
					text_align = "center",
				},
			},
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = false,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
			enforce_regular_tabs = false,
			always_show_bufferline = true,
		},
	})
end
function config.telescope()
	require("telescope").setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.BoldArrowRight .. " ",
			entry_prefix = "  ",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.9,
					results_width = 0.9,
				},
				vertical = {
					width = 0.5,
					prompt_position = "top",
				},
			},
			file_ignore_patterns = {
				"node_modules",
				"*.min.js",
				"addons",
			},
			path_display = { "truncate" },
			border = true,
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		},
		pickers = {
			find_files = {
				theme = "dropdown", -- ivy, cursor
			},
		},
		extensions = {
			aerial = {
				-- Display symbols as <root>.<parent>.<symbol>
				show_nesting = true,
			},
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = { "png", "webp", "jpg", "jpeg", "ico" },
				find_cmd = "fd", -- find command (defaults to `fd`)
			},
		},
	})

	pcall(function()
		require("telescope").load_extension("aerial")
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("notify")
	end)
end

function config.lualine()
	require("lualine").setup()
end

function config.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = {
				text = icons.ui.BoldLineLeft,
			},
			change = {
				text = icons.ui.BoldLineLeft,
			},
			delete = {
				text = icons.ui.BoldLineLeft,
			},
			topdelete = {
				text = icons.ui.BoldLineLeft,
			},
			changedelete = {
				text = icons.ui.BoldLineLeft,
			},
		},
		update_debounce = 200,
		current_line_blame = true,
	})
end
return config
