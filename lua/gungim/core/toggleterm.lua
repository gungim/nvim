local M = {}

M.config = function()
	GG.builtin.toGGleterm = {
		on_config_done = nil,
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
	}
end

function M.setup()
	local config = GG.builtin.toGGleterm

	local status_ok, toGGleterm = pcall(require, "toGGleterm")
	if not status_ok then
		return
	end

	toGGleterm.setup(config)
	if GG.builtin.toGGleterm.on_config_done then
		GG.builtin.toGGleterm.on_config_done(toGGleterm)
	end
end

function M.lazygit_toGGle()
	local Terminal = require("toGGleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
		float_opts = {
			border = "none",
			width = 100000,
			height = 100000,
		},
		on_open = function(_)
			vim.cmd("startinsert!")
		end,
		on_close = function(_) end,
		count = 99,
	})
	lazygit:toGGle()
end

return M
