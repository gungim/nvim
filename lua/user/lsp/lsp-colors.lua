local custom_colors = require("user.custom_colors")

require("lsp-colors").setup({
  Error = custom_colors.error,
  Warning = custom_colors.warning,
  Information = custom_colors.information,
  Hint = custom_colors.hint
})
