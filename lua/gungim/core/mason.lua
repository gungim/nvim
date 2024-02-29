local M = {}

function M.config()
	GG.builtin.mason = {
		ui = {
			check_outdated_packages_on_open = true,
			width = 0.8,
			height = 0.9,
			border = "rounded",
			keymaps = {
				toGGle_package_expand = "<CR>",
				install_package = "i",
				update_package = "u",
				check_package_version = "c",
				update_all_packages = "U",
				check_outdated_packages = "C",
				uninstall_package = "X",
				cancel_installation = "<C-c>",
				apply_language_filter = "<C-f>",
			},
		},
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
		PATH = "skip",
		pip = {
			upgrade_pip = false,
			install_args = {},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
		registries = {
			"lua:mason-registry.index",
			"github:mason-org/mason-registry",
		},
		providers = {
			"mason.providers.registry-api",
			"mason.providers.client",
		},
		github = {
			download_url_template = "https://github.com/%s/releases/download/%s/%s",
		},
		on_config_done = nil,
	}
end

function M.setup()
	local status_ok, mason = pcall(require, "mason")
	if not status_ok then
		return
	end

	mason.setup(GG.builtin.mason)

	require("mason-lspconfig").setup({
		ensure_installed = GG.lsp.automatic_configuration.mason_servers,
	})
	if GG.builtin.mason.on_config_done then
		GG.builtin.mason.on_config_done(mason)
	end
end

return M
