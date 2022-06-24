local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local bg_gray = "#262C34"
local error = "#f44336"
local warning = "orange"
local black = "#000208"
local sky = "#3D85C6"



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
  },
  highlights = {
    fill = {
      guibg = bg_gray,
    },
    background = {
      guibg = bg_gray
    },
    diagnostic_visible = {
      guibg = bg_gray
    },

    info = {

      guibg = bg_gray,
      guifg = sky
    },
    info_visible = {
      guibg = black,
      guifg = sky
    },
    info_selected = {
      guibg = black,
      guifg = sky,
      gui = "default",
    },
    info_diagnostic = {
      guibg = bg_gray,
      guifg = sky
    },
    info_diagnostic_visible = {
      guibg = black,
      guifg = sky
    },
    -- info_diagnostic_selected = {
    -- },

    warning = {
      guibg = bg_gray,
      guifg = warning
    },
    warning_visible = {
      guibg = black,
      guifg = warning
    },
    warning_selected = {
      guibg = black,
      guifg = warning,
      gui = "default",
    },
    warning_diagnostic = {
      guibg = bg_gray,
      guifg = warning
    },
    warning_diagnostic_visible = {
      guibg = black,
      guifg = warning
    },

    error = {
      guibg = bg_gray,
      guifg = error
    },
    error_visible = {
      guibg = black,
      guifg = error
    },
    error_diagnostic = {
      guibg = bg_gray,
      guifg = error
    },
    error_diagnostic_visible = {
      guibg = black,
      guifg = error
    },
    error_selected = {
      gui = "default",
      guibg = black,
      guifg = error
    },

    separator_selected = {
      guibg = bg_gray,
    },
    separator_visible = {
      guibg = bg_gray,
    },
    separator = {
      guibg = bg_gray,
    },

    modified = {
      guibg = bg_gray
    },
    modified_visible = {
      guibg = black,
    },
    modified_selected = {
      guibg = black,
    },
  };
}
