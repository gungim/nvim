vim.cmd [[
try
  set termguicolors
  set background=dark

catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme onedark
  set background=dark
endtry
]]


require "user.themes.github_theme_config"
