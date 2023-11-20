local M = {}
M.config = function()
	local icons = require("gungim.icons")
	GG.builtin.telescope = {
		active = true,
		on_config_done = nil,
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
			file_ignore_patterns = { "node_modules", "*.min.js" },
			path_display = { "truncate" },
			border = true,
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		},
		extensions_list = { "themes", "terms" },
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
	}
end

M.setup = function()
	local status_ok, telescope = pcall(require, "telescope")
	if not status_ok then
		return
	end
	local builtin = require("telescope.builtin")

	telescope.setup(GG.builtin.telescope)

	pcall(function()
		require("telescope").load_extension("aerial")
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("notify")
	end)

	if GG.builtin.telescope.on_config_done then
		GG.builtin.telescope.on_config_done(telescope)
	end
end
return M

-- local userful_keys = {
-- 	["<leader>sf"] = { builtin.find_files, {} },
-- 	["<leader>sl"] = { builtin.live_grep, {} },
-- 	["<leader>sb"] = { builtin.buffers, {} },
-- 	["<leader>sh"] = { builtin.help_tags, {} },
-- }
--
-- require("gungim.config.keymaps").load_mode("n", userful_keys)
