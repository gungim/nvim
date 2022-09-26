local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	'pyright',
	'tsserver',
	'tailwindcss',
	'sumneko_lua',
	"cmake",
	"cssmodules_ls",
	"diagnosticls",
	"eslint",
	"html",
	"jsonls",
	"volar",
	"clangd"
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
}

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')


local opts = {}

for _, server in ipairs(servers) do
	opts = {
		on_attach =
		require("user.lsp.lsp-config").on_attach,
		capabilities = require("user.lsp.lsp-config").capabilities
	}

	if server == "tailwindcss" then
		local tw_opts = require("user.lsp.settings.tailwindcss")
		opts = vim.tbl_deep_extend("force", tw_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require "user.lsp.settings.tsserver"
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "clangd" then
		local clangd_opts = require "user.lsp.settings.clangd"
		opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	end

	if server == "sumneko_lua" then
		local l_status_ok, lua_dev = pcall(require, "lua-dev")
		if not l_status_ok then
			return
		end
		local luadev = lua_dev.setup {
			lspconfig = {
				on_attach = opts.on_attach,
				capabilities = opts.capabilities,
			},
		}
		lspconfig.sumneko_lua.setup(luadev)
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
