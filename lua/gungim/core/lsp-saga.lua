local M = {}

M.setup = function()
	local status_ok, lspsaga = pcall(require, "lspsaga")
	if not status_ok then
		return
	end

	lspsaga.setup(GG.builtin.lspsaga)
	if GG.builtin.lspsaga.on_config_done then
		GG.builtin.lspsaga.on_config_done(lspsaga)
	end
end

M.config = function()
	GG.builtin.lspsaga = {
		on_config_done = nil,
	}
end

return M
