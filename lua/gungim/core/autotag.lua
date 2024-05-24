local M = {}
M.config = function()
	GG.builtin.autotag = {
		on_config_done = nil,
	}
end

M.setup = function()
	local status_ok, autotag = pcall(require, "nvim-ts-autotag")
	if not status_ok then
		return
	end
	autotag.setup(GG.builtin.autotag)

	if GG.builtin.autotag.on_config_done then
		GG.builtin.autotag.on_config_done(autotag)
	end
end
return M
