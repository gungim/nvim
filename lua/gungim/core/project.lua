local M = {}

M.config = function()
	GG.builtin.project = {
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
		show_hidden = true,
		silent_chdir = true,
		ignore_lsp = {},
		datapath = vim.fn.stdpath("data"),
	}
end

M.setup = function()
	local status_ok, project = pcall(require, "project_nvim")
	if not status_ok then
		return
	end
	project.setup(GG.builtin.project)

	if GG.builtin.project.on_config_done then
		GG.builtin.project.on_config_done(project)
	end
end
return M
