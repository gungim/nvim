local M = {}
M.config = function()
	GG.builtin.colorizer = {
		on_config_done = nil,
		filetypes = { "*" },
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Name" codes like Blue or blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			AARRGGBB = false, -- 0xAARRGGBB hex codes
			rgb_fn = false, -- CSS rgb() and rgba() functions
			hsl_fn = false, -- CSS hsl() and hsla() functions
			css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "background", -- Set the display mode.
			tailwind = true, -- Enable tailwind colors
			sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
			virtualtext = "■",
			always_update = false,
		},
		buftypes = {},
	}
end
M.setup = function()
	local status_ok, colorizer = pcall(require, "colorizer")
	if not status_ok then
		return
	end
	colorizer.setup(GG.builtin.colorizer)
	if GG.builtin.colorizer.on_config_done then
		GG.builtin.colorizer.on_config_done(colorizer)
	end
end

return M
