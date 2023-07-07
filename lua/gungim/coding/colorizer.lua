local M = {}
M.setup = function()
	local status_ok, colorizer = pcall(require, 'colorizer')

	if not status_ok then
		return
	end

	colorizer.setup({
		'*',
		'css',
		"postcss",
		'javascript',
		html = { mode = 'background' },
	}, { mode = 'background' })
end

return M
