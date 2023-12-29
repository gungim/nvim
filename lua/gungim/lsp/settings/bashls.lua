local util = require("lspconfig.util")

return {
	default_config = {
		cmd = { "bash-language-server", "start" },
		settings = {
			bashIde = {
				globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
			},
		},
		filetypes = { "sh" },
		root_dir = util.find_git_ancestor,
		single_file_support = true,
	},
}
