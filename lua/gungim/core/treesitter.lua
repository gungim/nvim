local M = {}

M.config = function()
	GG.builtin.treesitter = {
		on_config_done = nil,
		ensure_installed = {
			"lua",
			"c",
			"cpp",
			"html",
			"javascript",
			"java",
			"tsx",
			"svelte",
			"typescript",
			"rust",
			"scss",
			"css",
			"vue",
			"regex",
			"bash",
			"markdown",
			"markdown_inline",
			"prisma",
			"angular",
			"gdscript",
			"godot_resource",
		},
		sync_install = true,
		highlight = {
			enable = true,
		},
		autopairs = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { "yaml", "python", "TelescopePrompt" },
		},
	}
end

M.setup = function()
	local status_ok, tressiter = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	tressiter.setup(GG.builtin.treesitter)
	if GG.builtin.treesitter.on_config_done then
		GG.builtin.treesitter.on_config_done(tressiter)
	end
end

return M
