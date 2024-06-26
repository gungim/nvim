local M = {}

M.config = function()
	GG.builtin.aerial = {
		on_config_done = nil,
		backends = { "treesitter", "lsp", "markdown" },
		layout = {
			placement = "edge",
		},
		attach_mode = "global",
		close_automatic_events = { "unfocus" },
		highlight_on_hover = true,
		ignore = {
			unlisted_buffers = true,
		},
		show_guides = true,
	}
end

M.setup = function()
	local status_ok, aerial = pcall(require, "aerial")
	if not status_ok then
		return
	end

	aerial.setup(GG.builtin.aerial)

	if GG.builtin.aerial.on_config_done then
		GG.builtin.aerial.on_config_done(aerial)
	end
end

return M
