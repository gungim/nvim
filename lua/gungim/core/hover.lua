local M = {}
M.config = function()
	GG.builtin.hover = {
		on_config_done = nil,
		init = function()
			require("hover.providers.lsp")
			-- require("hover.providers.gh")
			-- require("hover.providers.man")
			-- require("hover.providers.dictionary")
		end,
		preview_opts = {
			border = nil,
		},
		mouse_providers = {
			"LSP",
		},
		title = true,
		mouse_delay = 1000,
	}
end

M.setup = function()
	local status_ok, hover = pcall(require, "hover")
	if not status_ok then
		return
	end
	hover.setup(GG.builtin.hover)

	vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
	vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

	vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
	vim.o.mousemoveevent = true

	if GG.builtin.hover.on_config_done then
		GG.builtin.hover.on_config_done(hover)
	end
end

return M
