local M = {}
M.setup = function()
	vim.cmd("set termguicolors")
	vim.cmd.colorscheme("tokyonight-night")

	local status_ok, tokyo = pcall(require, "tokyonight")
	if not status_ok then
		return
	end

	tokyo.setup({
		style = "night",
	})
end
return M
