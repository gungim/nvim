local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end
require("rust-tools")

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
	'lua_ls',
	"clangd",
	"diagnosticls",
	"eslint",
	"html",
	"jsonls",
	"volar",
	"lemminx",
	"cssls",
	"svelte",
	"rust_analyzer",
	"bashls"
	--[[ "angularls" ]]
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
<<<<<<<< HEAD:lua/modules/lsp/lsp-servers.lua
		require("modules.lsp.lsp-config").on_attach,
		capabilities = require("modules.lsp.lsp-config").capabilities
	}

	if server == "tailwindcss" then
		local tw_opts = require("modules.lsp.settings.tailwindcss")
========
		require("gungim.lsp.lsp-config").common_on_attach,
		capabilities = require("gungim.lsp.lsp-config").commont_capabilities()
	}

	if server == "tailwindcss" then
		local tw_opts = require("gungim.lsp.settings.tailwindcss")
>>>>>>>> main:lua/gungim/lsp/lsp-servers.lua
		opts = vim.tbl_deep_extend("force", tw_opts, opts)
	end

	if server == "tsserver" then
<<<<<<<< HEAD:lua/modules/lsp/lsp-servers.lua
		local tsserver_opts = require "modules.lsp.settings.tsserver"
========
		local tsserver_opts = require "gungim.lsp.settings.tsserver"
>>>>>>>> main:lua/gungim/lsp/lsp-servers.lua
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "clangd" then
<<<<<<<< HEAD:lua/modules/lsp/lsp-servers.lua
		local clangd_opts = require "modules.lsp.settings.clangd"
========
		local clangd_opts = require "gungim.lsp.settings.clangd"
>>>>>>>> main:lua/gungim/lsp/lsp-servers.lua
		opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	end

	if server == "eslint" then
<<<<<<<< HEAD:lua/modules/lsp/lsp-servers.lua
		local eslint_opts = require "modules.lsp.settings.eslint"
========
		local eslint_opts = require "gungim.lsp.settings.eslint"
>>>>>>>> main:lua/gungim/lsp/lsp-servers.lua
		opts = vim.tbl_deep_extend("force", eslint_opts, opts)
	end

	if server == "cssls" then
<<<<<<<< HEAD:lua/modules/lsp/lsp-servers.lua
		local css_opts = require "modules.lsp.settings.cssls"
========
		local css_opts = require "gungim.lsp.settings.cssls"
>>>>>>>> main:lua/gungim/lsp/lsp-servers.lua
		opts = vim.tbl_deep_extend("force", css_opts, opts)
	end

	if server == "lua_ls" then
<<<<<<<< HEAD:lua/modules/lsp/lsp-servers.lua
		local neodev_opts = require "modules.lsp.settings.lua_ls"
========
		local neodev_opts = require "gungim.lsp.settings.lua_ls"
>>>>>>>> main:lua/gungim/lsp/lsp-servers.lua
		lspconfig.lua_ls.setup(neodev_opts)
		goto continue
	end
	
	lspconfig[server].setup(opts)
	::continue::
end
