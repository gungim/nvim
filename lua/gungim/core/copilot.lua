local M = {}
M.config = function()
	GG.builtin.copilot = {
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = {
			["."] = false,
			gd = true,
			typescript = true,
			lua = true,
		},
	}
end
M.setup = function()
	local status_ok, copilot = pcall(require, "copilot")
	if not status_ok then
		return
	end

	-- copilot.setup(GG.builtin.copilot)
end
return M
