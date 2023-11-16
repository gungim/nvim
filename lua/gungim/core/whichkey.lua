local M = {}

M.config = function()
	gg.builtin.which_key = {
		on_config_done = nil,
		setup = {
			plugins = {
				presets = {
					operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				},
			},
			window = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 0, 0, 3, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 0, 2, 0 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				align = "center", -- align columns left, center or right
			},
			ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
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
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local opts = gg.builtin.which_key.opts
	local vopts = gg.builtin.which_key.vopts
	local mappings = gg.builtin.which_key.mappings
	local vmappings = gg.builtin.which_key.vmappings

	which_key.setup(gg.builtin.which_key.setup)
	which_key.register(mappings, opts)
	which_key.register(vmappings, vopts)
	if gg.builtin.which_key.on_config_done then
		gg.builtin.which_key.on_config_done(which_key)
	end
end

return M
