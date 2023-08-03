local M = {}

function M.load_defaults()
	local definitions = {
		{
			"TextYankPost",
			group = "_general_settings",
			pattern = "*",
			desc = "Highlight text on yank",
			call_back = function()
				vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
			end
		},
		{
			"VimResized",
			{
				group = "_auto_resize",
				pattern = "*",
				command = "tabdo wincmd =",
			},
		},
		{
			"FileType",
			{
				group = "_filetype_settings",
				pattern = "alpha",
				call_back = function()
					vim.cmd [[
						set showtabline = 2
					]]
				end
			}
		},
		{
			"FileType",
			{
				group = "_filetype_settings",
				pattern = "markdown",
				call_back = function()
					vim.cmd [[
						set showtabline = 2
					]]
				end
			}
		},
		{ -- taken from AstroNvim
			{ "BufRead", "BufWinEnter", "BufNewFile" },
			{
				group = "_file_opened",
				nested = true,
				callback = function(args)
					local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
					if not (vim.fn.expand "%" == "" or buftype == "nofile") then
						vim.api.nvim_del_augroup_by_name "_file_opened"
						vim.cmd "do User FileOpened"
						require("gungim.lsp").setup()
					end
				end,
			},
		},
	}
	M.define_autocmds(definitions)
end

function M.define_autocmds(definitions)
	for _, entry in ipairs(definitions) do
		local event = entry[1]
		local opts = entry[2] or {}
		if type(opts.group) == "string" and opts.group ~= "" then
			local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
			if not exists then
				vim.api.nvim_create_augroup(opts.group, {})
			end
		end
		vim.api.nvim_create_autocmd(event, opts)
	end
end

return M
