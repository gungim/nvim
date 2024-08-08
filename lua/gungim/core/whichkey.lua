local M = {}

M.config = function()
	GG.builtin.which_key = {
		on_config_done = nil,

		config = {
			window = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 0, 0, 3, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 0, 2, 0 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				align = "center", -- align columns left, center or right
				spacing = 5,
			},
			ignore_missing = true,
		},
		mappings = {
			[";"] = { "<cmd>AerialToggle!<CR>", "Aerial Toggle" },
			["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
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
				name = "CMake",
				r = { "<cmd>CMakeRun<cr>", "Run" },
				s = { "<cmd>CMakeStopRunner<cr>", "Stop runner" },
				b = { "<cmd>CMakeBuild<cr>", "Build" },
				i = { "<cmd>CMakeInstall<cr>", "Install" },
				c = { "<cmd>CMakeClean<cr>", "Clean" },
			},
			b = {
				name = "Buffer",
				o = { "<cmd>BufferLineCloseOthers<cr>", "Close Others" },
				l = { "<cmd>BufferLineCloseLeft<cr>", "Close Left" },
				r = { "<cmd>BufferLineCloseRight<cr>", "Close Right" },
				p = { "<cmd>BufferLineTogglePin<cr>", "Pin" },
			},
			g = {
				name = "Git",
				g = { "<cmd>lua require 'gungim.core.toggleterm'.lazygit_toggle()<CR>", "Lazygit" },
				-- g = { "<cmd>lua require 'gungim.core.toggleterm'.gitui_toggle()<CR>", "Lazygit" },
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
				-- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
				d = {
					"<cmd>Gitsigns diffthis HEAD<cr>",
					"Diff",
				},
			},
			l = {
				name = "LSP",
				i = { "<cmd>LspInfo<cr>", "Info" },
				I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
				r = { "<cmd>LspRestart<cr>", "Restart lsp" },
				s = { "<cmd>LspStart<cr>", "Start lsp" },
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
				m = { "<cmd>Telescope media_files theme=ivy<cr>", "Media" },
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
			t = { "<cmd>TodoLocList keywords=TODO,FIX<cr>", "Todo list" },
			w = {
				name = "Window",
				s = { "<cmd>split<cr>", "Split" },
				h = { "<cmd>vsplit<cr>", "VSplit" },
			},
		},
		vmappings = {
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			},
		},
		opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},
		vopts = {
			mode = "v", -- visual mode
			prefix = "<leader>",
			buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},
	}
end
M.setup = function()
	local status_ok, wk = pcall(require, "which-key")
	if not status_ok then
		return
	end
	wk.setup(GG.builtin.which_key.config)

	local opts = GG.builtin.which_key.opts
	local vopts = GG.builtin.which_key.vopts

	local mappings = GG.builtin.which_key.mappings
	local vmappings = GG.builtin.which_key.vmappings

	wk.register(mappings, opts)
	wk.register(vmappings, vopts)

	if GG.builtin.which_key.on_config_done then
		GG.builtin.which_key.on_config_done(wk)
	end
end

return M
