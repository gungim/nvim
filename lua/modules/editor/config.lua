local icons = require("core.icons")
local config = {}

function config.whichkey()
	local wk = require("which-key")

	wk.add({
		{ "<leader>;", "<cmd>AerialToggle!<CR>", desc = "Aerial Toggle" },
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", icon = "" },
		{ "<leader>q", "<cmd>Bdelete<CR>", desc = "Close Buffer" },
		{ "<leader>h", "<cmd>set nohlsearch!<CR>", desc = "No Highlight", icon = "" },
		{ "<leader>f", "<cmd>Format<cr>", desc = "Format" },
		-- Packer
		{ "<leader>p", group = "Packer", icon = "󰏖" },
		{ "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile" },
		{ "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", icon = "󰏔" },
		{ "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", icon = "󰏔" },
		{ "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", icon = "󰬐" },
		{ "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", icon = "󰏔" },
		-- Buffer
		{ "<leader>b", group = "Buffer" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others", icon = "󱪓" },
		{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left", icon = "󱪟" },
		{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right", icon = "󱪟" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin" },
		-- Git
		{ "<leader>g", group = "Git" },
		{ "<leader>gg", "<cmd>lua require 'keymap.toggleterm'.lazygit_toggle()<CR>", desc = "Lazygit" },
		-- g = { "<cmd>lua require 'gungim.core.toggleterm'.gitui_toggle()<CR>", "Lazygit" },
		{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
		{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
		{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
		{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
		-- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
		-- LSP
		{ "<leader>l", group = "LSP", icon = "" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
		{ "<leader>lr", "<cmd>LspRestart<cr>", desc = "Restart lsp" },
		{ "<leader>ls", "<cmd>LspStart<cr>", desc = "Start lsp" },
		-- Search
		{ "<leader>s", name = "Search", icon = "󰥨" },
		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", icon = "󰾚" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", icon = "" },
		{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sm", "<cmd>Telescope media_files theme=ivy<cr>", desc = "Media" },
		{
			"<leader>sf",
			"<cmd>Telescope find_files<cr>",
			desc = "Find files",
			icon = "󰈞",
		},
		{ "<leader>st", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
		{
			"<leader>sb",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			desc = "Buffers",
		},
		{ "<leader>sP", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
		-- Todo
		{ "<leader>t", "<cmd>TodoLocList keywords=TODO,FIX<cr>", desc = "Todo list", icon = "" },
		-- Window
		{ "<leader>w", group = "Window" },
		{ "<leader>ws", "<cmd>split<cr>", desc = "Split" },
		{ "<leader>wh", "<cmd>vsplit<cr>", desc = "VSplit" },
	})

	wk.add({
		mode = "v",
		{ "<leader>l", group = "LSP" },
		{ "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
	})

	wk.setup({
		preset = "modern",
	})
end

function config.nvim_treesitter()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"c",
			"cpp",
			"html",
			"javascript",
			"java",
			"tsx",
			"svelte",
			"typescript",
			"rust",
			"scss",
			"css",
			"vue",
			"regex",
			"bash",
			"markdown",
			"markdown_inline",
			"angular",
			"gdscript",
			"godot_resource",
			"json",
			"blade",
			"php"
		},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
				return false
			end,
		},
		autopairs = {
			enable = true,
		},
	})
end

function config.ibl()
	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
	}
	local hooks = require("ibl.hooks")
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end)

	vim.g.rainbow_delimiters = { highlight = highlight }

	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

	require("ibl").setup({
		indent = { highlight = nil, char = "▏" },
		scope = { enabled = true, highlight = highlight },
		on_config_done = nil,
	})
end

function config.toggleterm()
	require("toggleterm").setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<c-\>]],
		shade_filetypes = {},
		shading_factor = 2,
		direction = "float",
		shell = vim.o.shell,
		highlights = {
			FloatBorder = {
				guibg = "",
			},
		},
		float_opts = {
			border = "curved",
			winblend = 3,
		},
		winbar = {
			enabled = false,
			name_formatter = function(term) --  term: Terminal
				return term.name
			end,
		},
	})
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

return config
