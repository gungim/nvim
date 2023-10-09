local M = {}
M.config = function()
	gg.builtin.color_picker = {
		on_config_done = nil,
		["icons"] = { "ﱢ", "" },
		["border"] = "rounded", -- none | single | double | rounded | solid | shadow
		["background_highlight_group"] = "Normal", -- default
		["border_highlight_group"] = "FloatBorder", -- default
		["text_highlight_group"] = "Normal", --default
	}
end
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

M.setup = function()
	local config = gg.builtin.color_picker

	local status_ok, color_picker = pcall(require, "color-picker")
	if not status_ok then
		return
	end

	color_picker.setup(config)

	if config.on_config_done then
		config.on_config_done(color_picker)
	end
end

return M
