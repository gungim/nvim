local status_ok, lualine = pcall(require, "lualine")
local git_blame = require('gitblame')

local icons = require "user.icons"
if not status_ok then
	return
end

M = {}
-- check if value in table
local function contains(t, value)
	for _, v in pairs(t) do
		if v == value then
			return true
		end
	end
	return false
end

local hl_str = function(str, hl)
	return "%#" .. hl .. "#" .. str .. "%*"
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
	cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return icons.ui.Vim .. str .. icons.ui.Terminal
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = icons.git.Branch,
}

local location = {
	"location",
	padding = 0,
}

local lanuage_server = {
	function()
		local buf_ft = vim.bo.filetype
		local ui_filetypes = {
			"help",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
			"lspinfo",
			"lsp-installer",
			"",
		}

		if contains(ui_filetypes, buf_ft) then
			if M.language_servers == nil then
				return ""
			else
				return M.language_servers
			end
		end

		local clients = vim.lsp.buf_get_clients()
		local client_names = {}

		-- add client
		for _, client in pairs(clients) do
			if client.name ~= "copilot" and client.name ~= "null-ls" then
				table.insert(client_names, client.name)
			end
		end

		-- add formatter
		local s = require "null-ls.sources"
		local available_sources = s.get_available(buf_ft)
		local registered = {}
		for _, source in ipairs(available_sources) do
			for method in pairs(source.methods) do
				registered[method] = registered[method] or {}
				table.insert(registered[method], source.name)
			end
		end

		local formatter = registered["NULL_LS_FORMATTING"]
		local linter = registered["NULL_LS_DIAGNOSTICS"]
		if formatter ~= nil then
			vim.list_extend(client_names, formatter)
		end
		if linter ~= nil then
			vim.list_extend(client_names, linter)
		end

		-- join client names with commas
		local client_names_str = table.concat(client_names, ", ")

		-- check client_names_str if empty
		local language_servers = ""
		local client_names_str_len = #client_names_str
		if client_names_str_len ~= 0 then
			language_servers = hl_str("", "SLSep") .. hl_str(client_names_str, "SLSeparator") .. hl_str("", "SLSep")
		end

		if client_names_str_len == 0 then
			return ""
		else
			M.language_servers = language_servers
			return language_servers:gsub(", anonymous source", "")
		end
	end,
	padding = 0,
	cond = hide_in_width,
	-- separator = "%#SLSeparator#" .. " │" .. "%*",
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "", "", "", "", "", "", "", "", "", "", "", "", "", "" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	local type_tap = ""
	if vim.api.nvim_buf_get_option(0, "expandtab") == false then
		type_tap = "tab"
	else
		type_tap = "spaces"
	end
	return type_tap .. ": " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		theme = "auto",
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "Aerial" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = {
			{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
		},
		lualine_x = { lanuage_server, diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
