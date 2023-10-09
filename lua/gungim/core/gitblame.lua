local M = {}

M.config = function()
	gg.builtin.gitblame = {
		on_config_done = nil,
		enabled = true,
	}
end

M.setup = function()
	local status_ok, gb = pcall(require, "gitblame")
	if not status_ok then
		return
	end
	gb.setup(gg.builtin.gitblame)
	if gg.builtin.gitblame.on_config_done then
		gg.builtin.gitblame.on_config_done(gb)
	end
end

return M
