local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
	insert_mode = generic_opts_any,
	normal_mode = generic_opts_any,
	visual_mode = generic_opts_any,
	visual_block_mode = generic_opts_any,
	command_mode = generic_opts_any,
	operator_pending_mode = generic_opts_any,
	term_mode = { silent = true },
}

local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
	operator_pending_mode = "o",
}

local defaults = {
	insert_mode = {
		["jk"] = "<ESC>"
	},
	normal_mode = {
		--[[ Better window movement ]]
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",
		--[[Resize window]]
		--[[ ["<Up>"] = ":resize -2<CR>", ]]
		--[[ ["<Down>"] = ":resize +2<CR>", ]]
		--[[ ["<Left>"] = ":vertical resize -2<CR>", ]]
		--[[ ["<Right>"] = ":vertical resize +2<CR>", ]]
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
	}
}

function M.set_keymaps(mode, key, val)
	local opt = generic_opts[mode] or generic_opts_any
	if type(val) == "table" then
		opt = val[2]
		val = val[1]
	end
	if val then
		vim.keymap.set(mode, key, val, opt)
	else
		pcall(vim.api.nvim_del_keymap, mode, key)
	end
end

function M.load_mode(mode, keymaps)
	mode = mode_adapters[mode] or mode
	for k, v in pairs(keymaps) do
		M.set_keymaps(mode, k, v)
	end
end

function M.load(keymaps)
	keymaps = keymaps or {}
	for mode, mapping in pairs(keymaps) do
		M.load_mode(mode, mapping)
	end
end

function M.load_defaults()
  M.load(M.get_defaults())
end


function M.get_defaults()
  return defaults
end


return M
