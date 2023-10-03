local M = {}
function M.config()
	gungim.builtin.illuminate = {
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
		}
	}
end

function M.setup()
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.setup(gungim.builtin.illuminate)

  if gungim.builtin.illuminate.on_config_done then
    gungim.builtin.illuminate.on_config_done(illuminate)
  end
end

return M
