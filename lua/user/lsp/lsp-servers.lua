local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')

local servers = {
	'pyright',
	'tsserver',
	'tailwindcss',
	'sumneko_lua',
	"clangd",
	"cmake",
	"cssmodules_ls",
	"diagnosticls",
	"eslint",
	"html",
	"jsonls",
	"volar"
}

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
