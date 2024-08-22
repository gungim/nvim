local M = {}

M.config = function()
	GG.builtin.which_key = {
		on_config_done = nil,
		config = {
			preset = "modern",
			plugins = {
				presets = {
					operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				},
			},
			triggers = {
				-- { "<leader>", mode = { "n", "v" } },
			},
			win = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- none, single, double, shadow
				padding = { 4, 0 }, -- extra window margin [top, right, bottom, left]
			},
			layout = {
				align = "center", -- align columns left, center or right
				spacing = 5,
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
		},
		mappings = true,
	}
end
M.setup = function()
	local status_ok, wk = pcall(require, "which-key")
	if not status_ok then
		return
	end

	wk.setup(GG.builtin.which_key.config)

	wk.add({
		{
			mode = "n",
			{ "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Aerial Toggle" },
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", icon = "" },
			{ "<leader>q", "<cmd>Bdelete<CR>", desc = "Close Buffer" },
			{ "<leader>h", "<cmd>set nohlsearch!<CR>", desc = "No Highlight", icon = "" },
			{ "<leader>f", "<cmd>Format<cr>", desc = "Format" },
			-- Packer
			{ "<leader>p", group = "Packer", icon = "󰏖" },
			{ "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile" },
			{ "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install" },
			{ "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync" },
			{ "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status" },
			{ "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update" },
			-- Buffer
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin" },
			-- Git
			{ "<leader>g", group = "Git" },
			{ "<leader>gg", "<cmd>lua require 'gungim.core.toggleterm'.lazygit_toggle()<CR>", desc = "Lazygit" },
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
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
			{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sm", "<cmd>Telescope media_files theme=ivy<cr>", desc = "Media" },
			{
				"<leader>sf",
				"<cmd>Telescope find_files<cr>",
				desc = "Find files",
			},
			{ "<leader>st", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
			{
				"<leader>sb",
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				desc = "Buffers",
			},
			{ "<leader>sP", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
			{ "<leader>sT", "<cmd>Telescope<cr>", desc = "Telescope" },
			-- Todo
			{ "<leader>t", "<cmd>TodoLocList keywords=TODO,FIX<cr>", desc = "Todo list", icon = "" },
			-- Window
			{ "<leader>w", group = "Window" },
			{ "<leader>ws", "<cmd>split<cr>", desc = "Split" },
			{ "<leader>wh", "<cmd>vsplit<cr>", desc = "VSplit" },
		},
	})

	wk.add({
		mode = "v",
		{
			{ "<leader>l", group = "LSP", mode = "v" },
			{ "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
		},
	})

	if GG.builtin.which_key.on_config_done then
		GG.builtin.which_key.on_config_done(wk)
	end
end

return M
