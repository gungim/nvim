local gungim_theme = require("gungim_theme")
vim.cmd [[
  set termguicolors
  set background=dark
 colorscheme gungim_theme
  highlight NvimTreeFolderIcon guifg=#84FDFe
]]

gungim_theme.setup({ nvim_tree = { contrast = true } })
