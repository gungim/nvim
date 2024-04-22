local M = {}

M.config = function()
	GG.builtin.todo = {
		on_config_done = nil,
		signs = true,
		keywords = {
			DONE = {
				icon = " ",
				color = "#a6e3a1",
			},
		},
	}
end

M.setup = function()
	local status_ok, todo = pcall(require, "todo-comments")
	if not status_ok then
		return
	end

	todo.setup(GG.builtin.todo)
	if GG.builtin.todo.on_config_done then
		GG.builtin.todo.on_config_done(todo)
	end
end

return M
