packadd({
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	config = function()
		require("lsp_signature").setup({
			floating_window = false,

			fix_pos = true,
			hint_prefix = "🐼" .. " ",
			hint_scheme = "String",
			close_timeout = 1000,
			hi_parameter = "LspSignatureActiveParameter",

			-- handler_opts = { border = "single" },

			auto_close_after = 3,
			transparency = 50,
		})
	end,
})

packadd({
	"neovim/nvim-lspconfig",
	config = function()
		require("modules.lsp.config")
	end,
})
packadd({
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
})

packadd({

	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
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
				"volar",
				"angularls",
				"cmake",
				"prismals",
				"jdtls",
				"emmet_language_server",
			},
		})
	end,
})
