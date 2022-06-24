require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic",
  comment_style = "italic",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  dev = true,
  dark_float = true,
  dark_sidebar = true,

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = { hint = "orange", error = "#ff0000" },

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      -- this will remove the highlight groups
      Search = { fg = "#000000", bg = "#ffe599" },
      TSField = {},
      BufferLineIndicatorSelected = { fg = c.red }
    }
  end
})
