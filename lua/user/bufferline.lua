local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local colors = require("user.gungim_theme.core")


bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = nil, -- can be a string | function, see "Mouse actions"
    left_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

    indicator_icon = "",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",

    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,




    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
    highlights = {
      buffer_selected = {
        gui = "default",
        guifg = colors.color16
      },
      warning = {
        guifg = colors.warning,
        -- guisp = colors.warning,
      },
      warning_visible = {
        guifg = colors.warning,
      },
      warning_selected = {
        guifg = colors.warning,
        gui = "default",
        -- guisp = colors.warning
      },
      warning_diagnostic = {
        guifg = colors.warning,
        guisp = colors.warning,
      },
      warning_diagnostic_visible = {
        guifg = colors.warning,
      },
      warning_diagnostic_selected = {
        guifg = colors.warning,
        gui = "default",
      },
      error = {
        guifg = colors.error,
      },
      error_visible = {
        guifg = colors.error,
      },
      error_selected = {
        guifg = colors.error,
        gui = "default",
      },
      error_diagnostic = {
        guifg = colors.error,
      },
      error_diagnostic_visible = {
        guifg = colors.error,
      },
      error_diagnostic_selected = {
        guifg = colors.error,
        gui = "default",
      },
      info = {
        guifg = colors.sky,
      },
      info_visible = {
        guifg = colors.sky,
      },
      info_selected = {
        guifg = colors.sky,
        gui = "default",
      },
      info_diagnostic = {
        guifg = colors.sky,
      },
      info_diagnostic_visible = {
        guifg = colors.sky,
      },
      info_diagnostic_selected = {
        guifg = colors.sky,
        gui = "default",
      },
    }
  },
}
