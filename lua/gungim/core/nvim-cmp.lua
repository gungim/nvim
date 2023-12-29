local M = {}
M.config = function()
	local _, cmp = pcall(require, "cmp")
	local icons = GG.icons

	GG.builtin.cmp = {
		on_config_done = nil,
		preselect = cmp.PreselectMode.None,
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
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

	cmp.setup(GG.builtin.cmp)

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
			{ name = "cmdline" },
		}),
	})

	if GG.builtin.cmp.on_config_done then
		GG.builtin.cmp.on_config_done(cmp)
	end
end
return M
