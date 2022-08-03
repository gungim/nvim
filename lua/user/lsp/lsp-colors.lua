local gungim_theme = require('gungim_theme.core')
local colors = gungim_theme.get_colors()

require("lsp-colors").setup({
  Error = colors.error,
  Warning = colors.warning,
  Information = colors.info,
  Hint = colors.hint
})
