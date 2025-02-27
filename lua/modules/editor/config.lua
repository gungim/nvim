local icons = require("core.icons")
local config = {}
function config.formatter()
	local util = require("formatter.util")
	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			vue = {
				require("formatter.filetypes.vue").prettier,
			},
			typescript = {
				require("formatter.filetypes.typescript").prettier,
			},
			typescriptreact = {
				require("formatter.filetypes.typescriptreact").prettier,
			},
			html = {
				require("formatter.filetypes.html").prettier,
			},
			css = {
				require("formatter.filetypes.css").prettier,
			},
			less = {
				require("formatter.filetypes.css").prettier,
			},
			scss = {
				require("formatter.filetypes.css").prettier,
			},
			json = {
				require("formatter.filetypes.json").prettier,
			},
			javascript = {
				require("formatter.filetypes.javascript").prettier,
			},
			javascriptreact = {
				require("formatter.filetypes.javascriptreact").prettier,
			},
			svelte = {
				require("formatter.filetypes.svelte").prettier,
			},
			rust = {
				require("formatter.filetypes.rust").rustfmt(),
			},
			sh = {
				require("formatter.filetypes.sh").shfmt(),
			},
			["zsh"] = {
				require("formatter.filetypes.sh").shfmt(),
			},
			gdscript = {

				function()
					return {
						exe = "gdformat",
						args = {
							util.escape_path(util.get_current_buffer_file_path()),
						},
						stdin = false,
						ignore_exitcode = true,
					}
				end,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end
function config.cmp()
	local cmp = require("cmp")
	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		-- snippet = {
		-- 	expand = function(args)
		-- 		require("luasnip").lsp_expand(args.body)
		-- 	end,
		-- },
		mapping = cmp.mapping.preset.insert({
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),

		formatting = {
			format = function(_, vim_item)
				if icons.kind[vim_item.kind] then
					vim_item.kind = icons.kind[vim_item.kind]
				end
				return vim_item
			end,
		},
		matching = {
			disallow_fuzzy_matching = true,
			disallow_fullfuzzy_matching = true,
			disallow_partial_fuzzy_matching = true,
			disallow_partial_matching = true,
			disallow_prefix_unmatching = false,
		},
		sources = {
			{ name = "copilot", group_index = 2 },
			{ name = "nvim_lsp", group_index = 2 },
			-- { name = "luasnip", group_index = 2 },
			{ name = "buffer", group_index = 2 },
			{ name = "path" },
		},
		window = {
			-- border = { "╭", "─", "╮", "│", "╯", "─", "|", "|" },
			documentation = cmp.config.window.bordered(),
			completion = cmp.config.window.bordered(),
		},
	})
	-- `/` cmdline setup.
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "cmdline" },
		}),
	})
end

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

function config.nvim_treesiter()
	require("nvim-tressitter.configs").setup({
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
		},
		sync_install = true,
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
return config
