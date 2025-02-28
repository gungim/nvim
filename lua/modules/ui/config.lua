local icons = require("core.icons")
local colors = require("core.colors")
local config = {}

function config.theme()
	require("catppuccin").setup({
		custom_highlights = function(_)
			return {
				Normal = { bg = colors.mantle },
				NvimTreeNormal = { bg = colors.mantle },
				NvimTreeNormalNC = { bg = colors.base },
				NvimTreeWinSeparator = { fg = colors.teal },
				WinSeparator = { fg = colors.teal },
				Search = { bg = colors.sky, fg = colors.surface0 },
				TabLineSel = { bg = colors.teal },
			}
		end,
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
	local conf = require("modules.ui.lualine")
	require("lualine").setup(conf)
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

function config.noice()
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			signature = { enabled = false },
			progress = {
				format_done = {
					{ icons.ui.Check .. " ", hl_group = "NoiceLspProgressSpinner" },
					{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
					{ "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
				},
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		popupmenu = {
			kind_icons = icons.kind,
		},
		views = {
			cmdline_popup = {
				position = {
					row = "40%",
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
		},
	})
end
return config
