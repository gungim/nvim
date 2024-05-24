local M = {}

M.config = function()
	GG.builtin.toggleterm = {
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
	local config = GG.builtin.toggleterm

	local status_ok, toggleterm = pcall(require, "toggleterm")
	if not status_ok then
		return
	end

	toggleterm.setup(config)
	if GG.builtin.toggleterm.on_config_done then
		GG.builtin.toggleterm.on_config_done(toggleterm)
	end
end

function M.lazygit_toggle()
	local Terminal = require("toggleterm.terminal").Terminal
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
	lazygit:toggle()
end

function M.gitui_toggle()
	local Terminal = require("toggleterm.terminal").Terminal
	local gitui = Terminal:new({
		cmd = "gitui",
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
	gitui:toggle()
end

return M
