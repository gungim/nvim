local keymap = require("core.keymap")

keymap.load({
	insert_mode = {},
	normal_mode = {
		--[[ Better window movement ]]
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",
		--[[Resize window]]
		["<Up>"] = ":resize -2<CR>",
		["<Down>"] = ":resize +2<CR>",
		["<Left>"] = ":vertical resize -2<CR>",
		["<Right>"] = ":vertical resize +2<CR>",
		--[[ -- Tab/ Next tab ]]
		["<tab>"] = ":bnext<CR>",
		["<S-tab>"] = ":bprevious<CR>",
		["<A-j>"] = "<Esc>:m .+1<CR>==gi",
		["<A-k>"] = "<Esc>:m .-2<CR>==gi",
	},
	visual_mode = {
		["<"] = "<gv",
		[">"] = ">gv",
		-- Move text up and down
		["<A-j>"] = ":m .+1<CR>==",
		["<A-k>"] = ":m .-2<CR>==",
		["p"] = '"_dP',
	},
	visual_block_mode = {
		["J"] = ":move '>+1<CR>gv-gv",
		["K"] = ":move '<-2<CR>gv-gv",
		["<A-j>"] = ":move '>+1<CR>gv-gv",
		["<A-k>"] = ":move '<-2<CR>gv-gv",
	},
})
