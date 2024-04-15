local M = {}
M.config = function()
	GG.builtin["vue-goto-definition"] = {
		-- log_level = "trace",
		-- log_level = "debug",
		filters = {
			auto_imports = true,
			auto_components = true,
			import_same_file = true,
			declaration = true,
			duplicate_filename = true,
		},
		detection = {
			nuxt = function()
				return vim.fn.glob(".nuxt/") ~= ""
			end,
			vue3 = function()
				return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
			end,
			priority = { "nuxt", "vue3" },
		},
		lsp = {
			override_definition = true,
		},
	}
end

M.setup = function()
	require("vue-goto-definition").setup(GG.builtin["vue-goto-definition"])
end

return M
