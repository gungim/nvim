local M = {}
M.config = function()
	gg.builtin.signature = {
		on_config_done = nil,
		fix_pos = false,
		hint_prefix = "🐼" .. " ",
		hint_scheme = "String",
		noice = false,
		auto_close_after = 3,
		transparency = 50,
	}
end

M.setup = function()
	local status_ok, signature = pcall(require, "lsp_signature")
	if not status_ok then
		return
	end
	local cfg = gg.builtin.signature

	signature.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
	signature.on_attach(cfg) -- no need to specify bufnr if you don't use toggle_key

	if cfg.on_config_done then
		cfg.on_config_done(signature)
	end
end
return M
