local M = {}

M.config = function()
	GG.builtin.signature = {
		on_config_done = nil,
		floating_window = false,

		fix_pos = true,
		hint_prefix = "🐼" .. " ",
		hint_scheme = "String",
		close_timeout = 1000,
		hi_parameter = "LspSignatureActiveParameter",

		-- handler_opts = { border = "single" },

		auto_close_after = 3,
		transparency = 50,
	}
end

M.setup = function()
	local status_ok, signature = pcall(require, "lsp_signature")
	if not status_ok then
		return
	end
	local cfg = GG.builtin.signature

	signature.setup(cfg) -- no need to specify bufnr if you don't use toGGle_key
	signature.on_attach(cfg) -- no need to specify bufnr if you don't use toGGle_key

	if cfg.on_config_done then
		cfg.on_config_done(signature)
	end
end
return M
