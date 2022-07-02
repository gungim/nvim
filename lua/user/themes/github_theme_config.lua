local custom_colors = require("user.custom_colors")

require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic",
  comment_style = "italic",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  dark_sidebar = true,
  dev = false,
  -- dark_float = true,

  colors = { hint = custom_colors.hint, error = custom_colors.error },
  -- Overwrite the highlight groups
  overrides = function(c)
    return {

      BufferLineIndicatorSelected = { fg = custom_colors.sky_light },

      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      -- this will remove the highlight groups
      Search = { fg = custom_colors.black, bg = custom_colors.yellow },
      TSField = {},
      Cursor = { bg = custom_colors.tea },
      CursorLine = { bg = custom_colors.tea_dark },
      CursorLineNr = { fg = custom_colors.yellow },
      Pmenu = { bg = custom_colors.gray_light },
      PmenuThumb = { bg = custom_colors.sky_light },
      PmenuSbar = { bg = custom_colors.gray_light },
      -- Keyword = { fg = custom_colors.sky_light },
      String = { fg = custom_colors.green },
      -- Function = { fg = custom_colors.sky_light },
      -- Identifier = { fg = custom_colors.green },
      -- Number = {fg = custom_colors.sky_light}
      NvimTreeNormal = { bg = custom_colors.bg },
      Normal = { bg = custom_colors.bg },
      NormalNC = { fg = custom_colors.yellow, bg = custom_colors.bg }, -- normal text in non-current windows
      -- NormalSB = { fg = c.fg, bg = c.bg_sidebar }, -- normal text in non-current windows
      -- NormalFloat = { fg = c.fg, bg = c.bg_float },

    }
  end
})
