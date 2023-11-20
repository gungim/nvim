local M = {}

M.config = function() end

M.setup = function()
	local status_ok, cmt = pcall(require, "ts_context_commentstring")
	if not status_ok then
		return
	end
	cmt.setup({
		enable_autocmd = false,

		typescript = {
			__default = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
		javascript = {
			__default = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
		css = "/* %s */",
		scss = "/* %s */",
		html = "<!-- %s -->",
		svelte = "<!-- %s -->",
		vue = "<!-- %s -->",
		json = "",
	})
end

return M
