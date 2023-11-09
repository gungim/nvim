local M = {}
M.config = function()
	local _, luasnip = pcall(require, "luasnip")
	local _, cmp = pcall(require, "cmp")
	local icons = require("gungim.icons")

	gg.builtin.cmp = {
		on_config_done = nil,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
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
			fields = { "kind", "abbr", "menu" },
			format = function(_, vim_item)
				if icons[vim_item.kind] then
					vim_item.kind = icons[vim_item.kind] .. vim_item.kind
				end
				return vim_item
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		window = {
			documentation = cmp.config.window.bordered(),
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "x" },
			completion = cmp.config.window.bordered(),
		},
	}
end
M.setup = function()
	require("luasnip/loaders/from_vscode").lazy_load()
	local _, cmp = pcall(require, "cmp")

	cmp.setup(gg.builtin.cmp)

	-- `/` cmdline setup.
	cmp.setup.cmdline("/", {
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
		}, {
			{ name = "cmdline" },
		}),
	})

	if gg.builtin.cmp.on_config_done then
		gg.builtin.prettier.on_config_done(cmp)
	end
end
return M
