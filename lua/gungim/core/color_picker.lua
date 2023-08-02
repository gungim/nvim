local M = {}
M.config = function()
	gungim.builtin.color_picker = {
		setup = {

			["icons"] = { "ﱢ", "" },
			["border"] = "rounded",                  -- none | single | double | rounded | solid | shadow
			["background_highlight_group"] = "Normal", -- default
			["border_highlight_group"] = "FloatBorder", -- default
			["text_highlight_group"] = "Normal",     --default
		},
		active = true
	}
end
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

M.setup = function()
	local config = gungim.builtin.color_picker
	if not config.active then
		return
	end
	local status_ok, color_picker = pcall(require, "color-picker")
	if not status_ok then
		return
	end
	color_picker.setup(config.setup)
end

return M
