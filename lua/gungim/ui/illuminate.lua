local M = {}
function M.config()
	local config = {
		active = true,
		on_config_done = nil,
		options = {
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 120,
			filetype_overrides = {},
			filetypes_denylist = {
				"alpha",
				"NvimTree",
				"Trouble",
				"Outline",
				"spectre_panel",
				"toggleterm",
				--[[ "DressingSelect", ]]
				"TelescopePrompt",
			},
			filetypes_allowlist = {},
			modes_denylist = {},
			modes_allowlist = {},
			providers_regex_syntax_denylist = {},
			providers_regex_syntax_allowlist = {},
			under_cursor = true,
		},
	}
	return config
end

function M.setup()
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.setup(M.config)
end

return M
