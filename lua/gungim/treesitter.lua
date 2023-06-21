local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = { "lua", "cpp", "html", "javascript", "svelte", "typescript", "rust", "gdscript", "scss", "css" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml", "python" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			typescript = "// %s",
			css = "/* %s */",
			scss = "/* %s */",
			html = "<!-- %s -->",
			svelte = "<!-- %s -->",
			vue = "<!-- %s -->",
			json = "",
		}
	},
	autotag = {
		enable = true
	},
	rainbow = {
		enable = true,
		query = 'rainbow-parens',
		strategy = require('ts-rainbow').strategy.global,
	}
}
