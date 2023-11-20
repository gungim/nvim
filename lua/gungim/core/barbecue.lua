local M = {}

M.config = function()
	GG.builtin.barbecue = {
		on_config_done = nil,
	}
end

M.setup = function()
	local status_ok, barbecue = pcall(require, "barbecue")
	if not status_ok then
		return
	end

	barbecue.setup(GG.builtin.barbecue)

	if GG.builtin.barbecue.on_config_done then
		GG.builtin.barbecue.on_config_done(barbecue)
	end
end

return M
