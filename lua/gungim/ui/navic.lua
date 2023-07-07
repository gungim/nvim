local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require "gungim.icons"


navic.setup {
  icons = icons.kind,
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 5,
  depth_limit_indicator = "..",
}

