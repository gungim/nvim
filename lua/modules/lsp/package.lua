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
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = require("modules.lsp.config"),
})
