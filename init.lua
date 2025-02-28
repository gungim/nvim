local g = vim.g
vim.loader.enable()
g.mapleader = vim.keycode("<space>")

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.o.updatetime = 1000

require("core")
require("keymap")
