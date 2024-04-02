local M = {}

M.config = function()
	GG.builtin.todo = {
		on_config_done = nil,
	}
end

M.setup = function()
	local status_ok, todo = pcall(require, "todo-comments")
	if not status_ok then
		return
	end

	todo.setup()
	if GG.builtin.todo.on_config_done then
		GG.builtin.todo.on_config_done(todo)
	end
end

return M
