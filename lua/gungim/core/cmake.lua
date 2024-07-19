local M = {}

M.config = function()
	GG.builtin.cmake_tools = {
		on_config_done = nil,
	}
end

M.setup = function()
	local status_ok, cmake_tools = pcall(require, "cmake-tools")
	if not status_ok then
		return
	end
	cmake_tools.setup(GG.builtin.cmake_tools)

	if GG.builtin.cmake_tools.on_config_done then
		GG.builtin.cmake_tools.on_config_done(cmake_tools)
	end
end

return M
