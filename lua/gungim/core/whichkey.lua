local M = {}
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

M.config = function()
	gungim.builtin.which_key = {
		active = true,
		on_config_done = nil,
		setup = {
			plugins = {
				marks = true,  -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				presets = {
					operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true,     -- misc bindings to work with windows
					z = true,       -- bindings for folds, spelling and others prefixed with z
					g = true,       -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			-- operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+",  -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = border,      -- none, single, double, shadow
				position = "bottom",  -- bottom, top
				margin = { 0, 0, 3, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 0, 2, 0 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 },                                          -- min and max height of the columns
				width = { min = 20, max = 50 },                                          -- min and max width of the columns
				spacing = 3,                                                             -- spacing between columns
				align = "center",                                                        -- align columns left, center or right
			},
			ignore_missing = true,                                                     -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			show_help = true,                                                          -- show help message on the command line when the popup is visible
			triggers = "auto",                                                         -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specify a list manually
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
			},
		},
		mappings = {
			[";"] = { "<cmd>AerialToggle!<CR>", "Aerial Toggle" },
			["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
			["w"] = { "<cmd>w!<CR>", "Save" },
			["q"] = { "<cmd>Bdelete<CR>", "Close Buffer" },
			["h"] = { "<cmd>set nohlsearch!<CR>", "No Highlight" },
			["f"] = { "<cmd>Format<cr>", "Format" },
			p = {
				name = "Packer",
				c = { "<cmd>PackerCompile<cr>", "Compile" },
				i = { "<cmd>PackerInstall<cr>", "Install" },
				s = { "<cmd>PackerSync<cr>", "Sync" },
				S = { "<cmd>PackerStatus<cr>", "Status" },
				u = { "<cmd>PackerUpdate<cr>", "Update" },
			},
			c = {
				name = "Competi",
				c = { "<cmd>CompetiTestRun<cr>", "Run" },
				a = { "<cmd>CompetiTestAdd<cr>", "Add" },
				e = { "<cmd>CompetiTestEdit<cr>", "Edit" },
				d = { "<cmd>CompetiTestDelete<cr>", "Delete" },
				t = { "<cmd>CompetiTestReceive<cr>", "Download" },
			},
			g = {
				name = "Git",
				g = { "<cmd>lua require 'gungim.core.toggleterm'.lazygit_toggle()<CR>", "Lazygit" },
				j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
				k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				u = {
					"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
					"Undo Stage Hunk",
				},
				o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
				d = {
					"<cmd>Gitsigns diffthis HEAD<cr>",
					"Diff",
				},
			},
			l = {
				name = "LSP",
				i = { "<cmd>LspInfo<cr>", "Info" },
				I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			},
			b = {
				name = "Buffer",
				l = { "<cmd>BufferLineCloseLeft<CR>", "Close all buffer left" },
				r = { "<cmd>BufferLineCloseRight<CR>", "Close all buffer left" },
				o = { "<cmd>BufferLineCloseOthers<CR>", "Close all buffer other" },
				p = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
				m = { "<cmd>BufferLineTogglePin<CR>", "Toggle buffer pin" },
			},
			s = {
				name = "Search",
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
				m = { "<cmd>Telescope media_files<cr>", "Media" },
				f = {
					"<cmd>Telescope find_files<cr>",
					"Find files",
				},
				t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
				b = {
					"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
					"Buffers",
				},
				P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
				T = { "<cmd>Telescope<cr>", "Telescope" },
			},
		},
		vmappings = {
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			},
		},
		opts = {
			mode = "n",  -- NORMAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},
		vopts = {
			mode = "v",  -- visual mode
			prefix = "<leader>",
			buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},

	}
end
M.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local opts = gungim.builtin.which_key.opts
	local vopts = gungim.builtin.which_key.vopts
	local mappings = gungim.builtin.which_key.mappings
	local vmappings = gungim.builtin.which_key.vmappings

	which_key.setup(gungim.builtin.which_key.setup)
	which_key.register(mappings, opts)
	which_key.register(vmappings, vopts)
	if gungim.builtin.which_key.on_config_done then
		gungim.builtin.which_key.on_config_done(which_key)
	end
end



return M