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
			"angular",
			"gdscript",
			"godot_resource",
		},
		sync_install = true,
		highlight = {
			enable = true,
			disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
							return true
					end
					return false
			end,
		},
		autopairs = {
			enable = true,
		},
		-- indent = {
		-- 	enable = true,
		-- 	disable = { "yaml", "python", "TelescopePrompt" },
		-- },
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
