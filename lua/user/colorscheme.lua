vim.cmd [[
try
  set termguicolors
  set background=dark
  
  " colorscheme github_dark_default
  " colorscheme everforest
  " colorscheme darkplus
  " colorscheme zenbones
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme onedark
  set background=dark
endtry
]]
