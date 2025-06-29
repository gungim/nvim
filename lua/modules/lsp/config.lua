local keymap = require("core.keymap")

local au = vim.api.nvim_create_autocmd

local capabilities = require("cmp_nvim_lsp").default_capabilities()

au("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_clients({ id = args.data.client_id })[1]
		local bufnr = args.buf

		client.server_capabilities.semanticTokensProvider = nil
		require("lsp_signature").on_attach({
			floating_window = false,

			fix_pos = true,
			hint_prefix = "🐼" .. " ",
			hint_scheme = "String",
			close_timeout = 1000,
			hi_parameter = "LspSignatureActiveParameter",

			-- handler_opts = { border = "single" },

			auto_close_after = 3,
			transparency = 50,
		}, bufnr)

		keymap.load({
			normal_mode = {
				["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
				["gi"] = "<cmd>lua vim.lsp.buf.implementations()<CR>",
				["gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
				["gl"] = "<cmd>lua vim.diagnostic.open_float()<CR>",
			},
		})
	end,
})
au("CursorHold", {
	callback = function()
		local float_opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		}

		if not vim.b.diagnostics_pos then
			vim.b.diagnostics_pos = { nil, nil }
		end

		local cursor_pos = vim.api.nvim_win_get_cursor(0)
		if
			(cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
			and #vim.diagnostic.get() > 0
		then
			vim.diagnostic.open_float(nil, float_opts)
		end

		vim.b.diagnostics_pos = cursor_pos
	end,
})

local vue_language_server_path = vim.fn.expand("$MASON/packages")
	.. "/vue-language-server"
	.. "/node_modules/@vue/language-server"
-- or even
-- local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

local lsp_servers = {
	"vtsls",
	"vue_ls",
	"jdtls",
	"prismals",
	"angularls",
	"rust_analyzer",
	"intelephense",
	"bashls",
	"clangd",
	"cmake",
	"cssls",
	"eslint",
	"lua_ls",
	"gdscript",
	"stylelint_lsp",
	"svelte",
	"tailwindcss",
	"ts_ls",
}
local config = {
	bashls = {
		filetypes = { "zsh", "sh", "bash" },
	},
	clangd = {

		cmd = { "clangd", "--offset-encoding=utf-16" },
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.stdpath("config"),
					},
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	gdscript = {
		cmd = { "nc", "localhost", "6005" },
	},
	vue_ls = {
		on_init = function(client)
			client.handlers["tsserver/request"] = function(_, result, context)
				local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
				if #clients == 0 then
					vim.notify(
						"Could not found `vtsls` lsp client, vue_lsp would not work without it.",
						vim.log.levels.ERROR
					)
					return
				end
				local ts_client = clients[1]

				local param = unpack(result)
				local id, command, payload = unpack(param)
				ts_client:exec_cmd({
					command = "typescript.tsserverRequest",
					arguments = {
						command,
						payload,
					},
				}, { bufnr = context.bufnr }, function(_, r)
					local response_data = { { id, r.body } }
					---@diagnostic disable-next-line: param-type-mismatch
					client:notify("tsserver/response", response_data)
				end)
			end
		end,
	},
	vtsls = {
		init_options = {
			plugins = {
				vue_plugin,
			},
		},
		filetypes = { "vue" },
	},
	stylelint_lsp = {
		filetypes = {
			"astro",
			"css",
			"less",
			"scss",
			"sugarss",
			"vue",
			"wxss",
		},
	},
}

-- Mapping servers to config
for _, name in ipairs(lsp_servers) do
	local conf = config[name]
	if conf then
		vim.lsp.config(name, conf)
	end
end
vim.lsp.enable(lsp_servers)
