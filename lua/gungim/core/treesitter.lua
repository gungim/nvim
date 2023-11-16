local M = {}

M.config = function()
	gg.builtin.treesitter = {
		on_config_done = nil,
		ensure_installed = {
			"lua",
			"c",
			"cpp",
			"html",
			"javascript",
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
			"prisma"
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
		context_commentstring = {
			enable = true,
			enable_autocmd = true,
			config = {
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
				html = "<!-- %s -->",
				svelte = "<!-- %s -->",
				vue = "<!-- %s -->",
				json = "",
			},
		},
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = false,
			filetypes = {
				"xml",
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"php",
				"markdown",
				"glimmer",
				"handlebars",
				"hbs",
				"tpl",
			},
			skip_tags = {
				"area",
				"base",
				"br",
				"col",
				"command",
				"embed",
				"hr",
				"img",
				"slot",
				"input",
				"keygen",
				"link",
				"meta",
				"param",
				"source",
				"track",
				"wbr",
				"menuitem",
			},
		},
		rainbow = {
			enable = true,
			disable = { "html", "python", "yaml" },
			strategy = require("ts-rainbow").strategy.global,
		},
	}
end

M.setup = function()
	local status_ok, tressiter = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	tressiter.setup(gg.builtin.treesitter)

	if gg.builtin.treesitter.on_config_done then
		gg.builtin.treesitter.on_config_done(tressiter)
	end
end

return M
