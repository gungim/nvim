local colors = GG.colors
local icons = require("gungim.icons")
local M = {}

M.config = function()
	GG.builtin.cokeline = {
		on_config_done = nil,
		default_hl = {
			bg = function(buffer)
				return buffer.is_focused and colors.surface0 or colors.base
			end,
			fg = function(buffer)
				if buffer.is_focused then
					if buffer.diagnostics.errors > 0 then
						return colors.diag.error
					elseif buffer.diagnostics.warnings > 0 then
						return colors.diag.warning
					elseif buffer.diagnostics.hints > 0 then
						return colors.diag.hint
					end
				else
					return colors.surface2
				end
			end,
			sp = colors.sapphire,
		},
		new_buffers_position = "number",
		components = {
			{
				text = " ",
			},
			{
				text = function(buffer)
					return buffer.devicon.icon
				end,
				fg = function(buffer)
					return buffer.devicon.color
				end,
			},
			{
				text = function(buffer)
					return buffer.filename
				end,
				-- style = function(buffer)
				-- 	return buffer.is_focused and "bold,italic" or nil
				-- end,
				bold = function(buffer)
					return buffer.is_focused
				end,
				italic = function(buffer)
					return buffer.is_focused
				end,
				underline = function(buffer)
					return buffer.is_focused
				end,
			},
			{
				text = function(buffer)
					local result = {}
					local symbols = {
						errors = icons.diagnostics.Error,
						warnings = icons.diagnostics.Warning,
						infos = icons.diagnostics.Information,
						hints = icons.diagnostics.Hint,
					}
					for name, count in pairs(buffer.diagnostics) do
						if symbols[name] and count > 0 then
							table.insert(result, " " .. symbols[name] .. " " .. count)
						end
					end
					local r = table.concat(result, " ")
					return #r > 0 and r or ""
				end,
			},
			{
				text = function(buffer)
					return buffer.is_modified and " " .. icons.git.FileUnstaged .. " " or ""
				end,
				fg = colors.sapphire,
			},
			{
				text = " ",
			},
		},
		sidebar = {
			---@type string | string[]
			filetype = { "NvimTree", "neo-tree", "SidebarNvim" },
			---@type Component[]
			components = {
				{
					text = function(buf)
						return buf.filetype
					end,
					fg = colors.yellow,
					bg = colors.base,
					bold = true,
				},
			},
		},
	}
end

M.setup = function()
	local status_ok, cokeline = pcall(require, "cokeline")
	if not status_ok then
		return
	end

	cokeline.setup(GG.builtin.cokeline)

	if GG.builtin.cokeline.on_config_done then
		GG.builtin.cokeline.on_config_done(cokeline)
	end
end
return M
