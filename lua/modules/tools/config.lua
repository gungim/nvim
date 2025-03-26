local icons = require("core.icons")
local config = {}
function config.formatter()
	local util = require("formatter.util")
	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			vue = {
				require("formatter.filetypes.vue").prettier,
			},
			typescript = {
				require("formatter.filetypes.typescript").prettier,
			},
			typescriptreact = {
				require("formatter.filetypes.typescriptreact").prettier,
			},
			html = {
				require("formatter.filetypes.html").prettier,
			},
			css = {
				require("formatter.filetypes.css").prettier,
			},
			less = {
				require("formatter.filetypes.css").prettier,
			},
			scss = {
				require("formatter.filetypes.css").prettier,
			},
			json = {
				require("formatter.filetypes.json").prettier,
			},
			javascript = {
				require("formatter.filetypes.javascript").prettier,
			},
			javascriptreact = {
				require("formatter.filetypes.javascriptreact").prettier,
			},
			svelte = {
				require("formatter.filetypes.svelte").prettier,
			},
			rust = {
				require("formatter.filetypes.rust").rustfmt(),
			},
			sh = {
				require("formatter.filetypes.sh").shfmt(),
			},
			["zsh"] = {
				require("formatter.filetypes.sh").shfmt(),
			},
			gdscript = {
				function()
					return {
						exe = "gdformat",
						args = {
							util.escape_path(util.get_current_buffer_file_path()),
						},
						stdin = false,
						ignore_exitcode = true,
					}
				end,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end

function config.cmp()
	local cmp = require("cmp")
	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		mapping = cmp.mapping.preset.insert({
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),

		formatting = {
			format = function(_, vim_item)
				if icons.kind[vim_item.kind] then
					vim_item.kind = icons.kind[vim_item.kind]
				end
				return vim_item
			end,
		},
		matching = {
			disallow_fuzzy_matching = true,
			disallow_fullfuzzy_matching = true,
			disallow_partial_fuzzy_matching = true,
			disallow_partial_matching = true,
			disallow_prefix_unmatching = false,
		},
		sources = {
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
		},
		window = {
			-- border = { "╭", "─", "╮", "│", "╯", "─", "|", "|" },
			documentation = cmp.config.window.bordered(),
			completion = cmp.config.window.bordered(),
		},
	})
	-- `/` cmdline setup.
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "cmdline" },
		}),
	})
end
return config
