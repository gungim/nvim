packadd({
	"neovim/nvim-lspconfig",
	config = function()
		require("modules.lsp.config")
	end,
})

packadd({
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
})
packadd({
	"mason-org/mason.nvim",
	config = function()
		require("mason").setup()
	end,
})

packadd({
	"mason-org/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = { "gdtoolkit" },
			},
			ensure_installed = {
				"ts_ls",
				"tailwindcss",
				"lua_ls",
				"clangd",
				"diagnosticls",
				"eslint",
				"html",
				"jsonls",
				"lemminx",
				"cssls",
				"svelte",
				"rust_analyzer",
				"bashls",
				"vue_ls",
				"vtsls",
				"angularls",
				"cmake",
				"prismals",
				"jdtls",
				"intelephense",
			},
		})
	end,
})
