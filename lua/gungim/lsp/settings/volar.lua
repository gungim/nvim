local lspconfig_util = require("lspconfig.util")

local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = lspconfig_util.root_pattern("package.json")

local function on_new_config(new_config, new_root_dir)
	local function get_typescript_server_path(root_dir)
		local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
		-- print("" .. project_root)
		return project_root and (lspconfig_util.path.join(project_root, "node_modules")) or ""
	end

	if
		new_config.init_options
		and new_config.init_options.typescript
		and new_config.init_options.typescript.tsdk == ""
	then
		new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
	end
end

return {
	cmd = volar_cmd,
	root_dir = volar_root_dir,
	on_new_config = on_new_config,
	filetypes = { "vue" },
	init_options = {
		typescript = {
			tsdk = "",
		},
		languageFeatures = {
			implementation = true, -- new in @volar/vue-language-server v0.33
			references = true,
			definition = true,
			typeDefinition = true,
			callHierarchy = true,
			hover = true,
			rename = true,
			renameFileRefactoring = true,
			signatureHelp = true,
			codeAction = true,
			workspaceSymbol = true,
			completion = {
				defaultTagNameCase = "both",
				defaultAttrNameCase = "kebabCase",
				getDocumentNameCasesRequest = false,
				getDocumentSelectionRequest = false,
			},
		},
	},
}
