local M = {}
M.setup = function()
	local _, luasnip = pcall(require, "luasnip")
	local cmp_status_ok, cmp = pcall(require, "cmp")
	if not cmp_status_ok then
		return
	end
	local icons = require("gungim.icons")

	require("luasnip/loaders/from_vscode").lazy_load()

	cmp.setup {
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
			["<C-e>"] = cmp.mapping {
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			},
			["<CR>"] = cmp.mapping.confirm { select = true },
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
			{ name = "nvim_lsp", priority = 1000 },
			{ name = "luasnip",  priority = 750 },
			{ name = "buffer",   priority = 500 },
			{ name = "path",     priority = 250 },
		},
		window = {
			documentation = cmp.config.window.bordered(),
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "x" },
			completion = cmp.config.window.bordered()
		},
		duplicates = {
			nvim_lsp = 1,
			luasnip = 1,
			cmp_tabnine = 1,
			buffer = 1,
			path = 1,
		},
	}
end
return M
