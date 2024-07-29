local M = {}

M.config = function()
	GG.builtin.mini = {
		on_config_done = nil,
		comment = {
			options = {
				ignore_blank_line = true,
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	}
end

M.setup = function()
	for name, config in pairs(GG.builtin.mini) do
		local _, plug = pcall(require, "mini." .. name)
		plug.setup(config)
	end

	if GG.builtin.mini.on_config_done then
		GG.builtin.mini.on_config_done("mini")
	end
end

return M
