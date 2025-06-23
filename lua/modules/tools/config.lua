local icons = require("core.icons")
local config = {}

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

function config.conform()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			htmlangular = { "prettier" },
			gdscript = { "gdformat" },
			less = { "stylelint", "prettier" },
			scss = { "stylelint", "prettier" },
			css = { "stylelint", "prettier" },
		},
		formatters = {
			gdformat = {
				command = "gdformat",
				args = { "$FILENAME" },
				stdin = false, -- gdformat works with files
			},
		},
	})
end
return config
