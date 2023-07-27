local M = {}

M.setup = function()
	local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
	if not status_ok then
		return
	end


	configs.setup {
		ensure_installed = {
			'lua', 'cpp', 'html', 'javascript', "tsx", 'svelte', 'typescript',
			'rust', 'scss', 'css', 'vue', 'regex', 'bash', 'markdown', 'markdown_inline'
		},
		sync_install = false,
		highlight = {
			enable = true,
		},

		autopairs = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { 'yaml', 'python', 'TelescopePrompt' },
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = true,
			config = {
				typescript = {
					__default = '// %s',
					jsx_element = '{/* %s */}',
					jsx_fragment = '{/* %s */}',
					jsx_attribute = '// %s',
					comment = '// %s',
				},
				javascript = {
					__default = '// %s',
					jsx_element = '{/* %s */}',
					jsx_fragment = '{/* %s */}',
					jsx_attribute = '// %s',
					comment = '// %s',
				},

				css = '/* %s */',
				scss = '/* %s */',
				html = '<!-- %s -->',
				svelte = '<!-- %s -->',
				vue = '<!-- %s -->',
				json = '',
			}
		},
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
			filetypes = {
				'xml', 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
				'rescript', 'php', 'markdown', 'glimmer', 'handlebars', 'hbs', 'tpl'
			},
			skip_tags = {
				'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
				'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr', 'menuitem'
			}

		},
		rainbow = {
			enable = false,
			extended_mode = true,
		},
	}
end

return M
