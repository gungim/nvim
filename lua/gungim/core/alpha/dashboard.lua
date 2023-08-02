local dash = require("gungim.alpha_das")

local M = {}

function M.get_section()
	local header = {
		type = "text",
		val = dash.luu_ly,
		opts = {
			hl = "Label",
			position = "center"
		}
	}
	local buttons = {
		entries = {
			{ "f", "  Find file",           ":Telescope find_files <CR>" },
			{ "e", "  New file",            ":ene <BAR> startinsert <CR>" },
			{ "p", "  Find project",        ":Telescope projects <CR>" },
			{ "r", "  Recently used files", ":Telescope oldfiles <CR>" },
			{ "t", "  Find text",           ":Telescope live_grep <CR>" },
			{ "c", "  Configuration",       ":e ~/.config/nvim/init.lua <CR>" },
			{ "q", "  Quit Neovim",         ":qa<CR>" },
		},
		opts = {
			hl_shortcut = "Include",
			spacing = 1,
		}
	}
	local footer = {
		val = function()
			return "GUNGIM LOVE LUULY"
		end,
		opts = {
			hl = "Type",
			position = "center"
		}
	}
	return {
		header = header,
		buttons = buttons,
		footer = footer
	}
end

return M
