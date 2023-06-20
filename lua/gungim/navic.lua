local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require "gungim.icons"


navic.setup {
  icons = {
    File = icons.kind.File,
    Module = icons.kind.Module,
    Namespace = icons.kind.Operator,
    Package = icons.kind.Module,
    Class = icons.kind.Class,
    Method = icons.kind.Method,
    Property = icons.kind.Property,
    Field = icons.kind.Field,
    Constructor = icons.kind.Constructor,
    Enum = icons.kind.Enum,
    Interface = icons.kind.Interface,
    Function = icons.kind.Function,
    Variable = icons.kind.Variable,
    Constant = icons.kind.Constant,
    String = icons.kind.String,
    Number = icons.kind.Number,
    Boolean = icons.kind.Boolean,
    Array = icons.kind.Array,
    Object = icons.kind.Object,
    Key = icons.kind.Constant,
    Null = icons.kind.Unit,
    EnumMember = icons.kind.EnumMember,
    Struct = icons.kind.Struct,
    Event = icons.kind.Event,
    Operator = icons.kind.Operator,
    TypeParameter =icons.kind.TypeParameter

  },
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}

