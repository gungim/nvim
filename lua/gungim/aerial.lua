-- Call the setup function to change the default behavior
require("aerial").setup({
  backends = { "treesitter", "lsp", "markdown" },
  layout = {
    max_width = { 40, 0.2 },
    width = nil,
    min_width = 10,
    default_direction = "prefer_right",
    placement = "edge",
  },
  attach_mode = "global",
  close_automatic_events = {"unfocus"},
  default_bindings = true,
  disable_max_lines = 10000,
  disable_max_size = 2000000, -- Default 2MB
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  highlight_mode = "split_width",
  highlight_closest = true,
  highlight_on_hover = true,
  highlight_on_jump = 300,
  icons = {},
  ignore = {
    unlisted_buffers = true,
    filetypes = {},
    buftypes = "special",
    wintypes = "special",
  },
  link_folds_to_tree = false,
  link_tree_to_folds = true,
  manage_folds = false,
  nerd_font = "auto",
  on_attach = nil,
  on_first_symbols = nil,
  open_automatic = false,
  post_jump_cmd = "normal! zz",
  close_on_select = false,
  show_guides = true,
  update_events = "TextChanged,InsertLeave",
  guides = {
    mid_item = "├─",
    last_item = "└─",
    nested_top = "│ ",
    whitespace = "  ",
  },
  float = {
    border = "rounded",
    relative = "cursor",
    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.1 },
    override = function(conf)
      return conf
    end,
  },
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true,
    update_delay = 300,
  },
  treesitter = {
    update_delay = 300,
  },
  markdown = {
    update_delay = 300,
  },
})
