local M = {}
M.config = function()
	GG.builtin.luasnip = {
		store_selection_keys = "<M-v>",
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
		enable_autosnippets = true,
	}
end
M.setup = function()
	local status_ok, sn = pcall(require, "luasnip")
	if not status_ok then
		return
	end
	sn.setup({
		store_selection_keys = "<M-v>",
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
		enable_autosnippets = true,
	})
	require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
end
return M
