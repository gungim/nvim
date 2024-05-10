local M = {}
local icons = require("gungim.icons")

M.config = function()
	GG.builtin.smoothcursor = {

		autostart = true,
		on_config_done = nil,
		cursor = "", -- cursor shape (need nerd font)
		texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
		linehl = nil, -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
		type = "matrix", -- define cursor movement calculate function, "default" or "exp" (exponential).
		fancy = {
			enable = true, -- enable fancy mode
			head = { cursor = icons.ui.TriangleShortArrowRight, texthl = "SmoothCursor", linehl = nil },
			body = {
				{ cursor = "", texthl = "SmoothCursorRed" },
				{ cursor = "", texthl = "SmoothCursorOrange" },
				{ cursor = "●", texthl = "SmoothCursorYellow" },
				{ cursor = "●", texthl = "SmoothCursorGreen" },
				{ cursor = "•", texthl = "SmoothCursorAqua" },
				{ cursor = ".", texthl = "SmoothCursorBlue" },
				{ cursor = ".", texthl = "SmoothCursorPurple" },
			},
			tail = { cursor = nil, texthl = "SmoothCursor" },
		},
		matrix = { -- Loaded when 'type' is set to "matrix"
			head = {
				-- Picks a random character from this list for the cursor text
				cursor = require("smoothcursor.matrix_chars"),
				-- Picks a random highlight from this list for the cursor text
				texthl = {
					"SmoothCursorRed",
				},
				linehl = nil, -- No line highlight for the head
			},
			body = {
				length = 6, -- Specifies the length of the cursor body
				-- Picks a random character from this list for the cursor body text
				cursor = require("smoothcursor.matrix_chars"),
				-- Picks a random highlight from this list for each segment of the cursor body
				texthl = {
					"SmoothCursorAqua",
				},
			},
			tail = {
				-- Picks a random character from this list for the cursor tail (if any)
				cursor = nil,
				-- Picks a random highlight from this list for the cursor tail
				texthl = {
					"SmoothCursorAqua",
				},
			},
			unstop = false, -- Determines if the cursor should stop or not (false means it will stop)
		},
		speed = 25, -- max is 100 to stick to your current position
		intervals = 35, -- tick interval
		priority = 10, -- set marker priority
		timeout = 3000, -- timout for animation
		threshold = 3, -- animate if threshold lines jump
		enabled_filetypes = nil, -- example: { "lua", "vim" }
		disabled_filetypes = nil, -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
	}
end

function M.setup()
	local status_ok, smoothcursor = pcall(require, "smoothcursor")
	if not status_ok then
		return
	end
	smoothcursor.setup(GG.builtin.smoothcursor)

	if GG.builtin.smoothcursor.on_config_done then
		GG.builtin.smoothcursor.on_config_done(smoothcursor)
	end
end
return M
