local M = {}

M.config = function()
	GG.builtin.gitblame = {
		on_config_done = nil,
		enabled = true,
	}
end

M.setup = function()
	local status_ok, gb = pcall(require, "gitblame")
	if not status_ok then
		return
	end
	gb.setup(GG.builtin.gitblame)
	if GG.builtin.gitblame.on_config_done then
		GG.builtin.gitblame.on_config_done(gb)
	end
end

return M
