local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = { "lua", "cpp", "html", "javascript", "svelte", "typescript", "rust", "gdscript", "scss", "css" },
	sync_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},

	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true
	},
	rainbow = {
		enable = true,
	}
}
