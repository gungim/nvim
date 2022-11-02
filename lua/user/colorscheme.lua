local status_ok, lualine = pcall(require, "lualine")

local icons = require "user.icons"
if not status_ok then
	return
end

--[[ lualine.setup({ ]]
--[[ 	options = { ]]
--[[ 		theme = "nightfox", ]]
--[[ 	} ]]
--[[ }) ]]

vim.cmd("set termguicolors")
--[[ vim.cmd("colorscheme blossom") ]]
vim.cmd("colorscheme duskfox")
--[[ vim.cmd("colorscheme darkplus") ]]
--[[ vim.cmd("colorscheme catppuccin_macchiato") ]]
