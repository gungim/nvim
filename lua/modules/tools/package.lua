local conf = require("modules.tools.config")
packadd({
	"mhartington/formatter.nvim",
	config = conf.formatter,
})

packadd({
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	config = conf.cmp,
})

packadd({
	"JoosepAlviste/nvim-ts-context-commentstring",
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
			languages = {
				typescript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
				javascript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
				css = "/* %s */",
				scss = "/* %s */",
				less = "/* %s */",
				html = "<!-- %s -->",
				svelte = "<!-- %s -->",
				vue = "<!-- %s -->",
				gdscript = "# %s",
				rust = { __default = "// %s", __multiline = "/* %s */" },
			},
		})
	end,
})

packadd({
	"echasnovski/mini.comment",
	version = "*",
	config = function()
		require("mini.comment").setup({
			options = {
				ignore_blank_line = true,
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
				end,
			},
		})
	end,
})

packadd({
	"zbirenbaum/copilot.lua",
	cmd = "Copilot disable",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
})

packadd({
	"zbirenbaum/copilot-cmp",
	config = function()
		require("copilot_cmp").setup()
	end,
})
