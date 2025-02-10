local M = {}
local Log = require("gungim.log")
local set = vim.keymap.set

local function lauch_server(server_name, config)
	require("lspconfig")[server_name].setup(config)
end

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	capabilities.textDocument.completion.completionItem.snippetSupport = true

	return capabilities
end

M.add_lsp_keymap = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local bufopts = { buffer = bufnr, silent = true, noremap = true }

			set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
			set("n", "gi", "<cmd>lua vim.lsp.buf.implementations()<CR>", bufopts)
			set("n", "gr", vim.lsp.buf.references, bufopts)
			set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)

			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
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
		end,
	})
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end

	client.server_capabilities["documentSymbolProvider"] = true
	navic.attach(client, bufnr)
end

M.on_attach = function(client, bufnr)
	attach_navic(client, bufnr)
end

M.setup = function()
	M.add_lsp_keymap()
	local mason_servers = GG.lsp.automatic_configuration.mason_servers
	local other_servers = GG.lsp.automatic_configuration.other_servers
	local server_default_config = require("gungim.lsp.server-config")

	--- Lauch config for mason server
	for _, server in ipairs(mason_servers) do
		local config = server_default_config[server] or {}
		local opts = vim.tbl_deep_extend("force", {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}, config)
		lauch_server(server, opts)
	end

	--- Lauch config for other server
	for _, server in ipairs(other_servers) do
		local config = server_default_config[server] or {}
		local opts = vim.tbl_deep_extend("force", {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}, config)
		lauch_server(server, opts)
	end
end

return M
