local M = {}
local icons = require("gungim.icons")
local colors = require("tokyonight.colors").setup()

local mode = function()
	local mod = vim.fn.mode()
	local _time = os.date "*t"

	local selector = math.floor(_time.hour / 8) + 1
	local normal_icons = {
		"󰊠",
		"",
		"",
	}
	if mod == "n" or mod == "no" or mod == "nov" then
		return normal_icons[selector]
	elseif mod == "i" or mod == "ic" or mod == "ix" then
		local insert_icons = {
			"",
			"",
			"",
		}
		return insert_icons[selector]
	elseif mod == "V" or mod == "v" or mod == "vs" or mod == "Vs" or mod == "cv" then
		local verbose_icons = {
			"",
			"",
			"",
		}
		return verbose_icons[selector]
	elseif mod == "c" or mod == "ce" then
		local command_icons = {
			"󰏒",
			"",
			"",
		}

		return command_icons[selector]
	elseif mod == "r" or mod == "rm" or mod == "r?" or mod == "R" or mod == "Rc" or mod == "Rv" or mod == "Rv" then
		local replace_icons = {
			"",
			"",
			"",
		}
		return replace_icons[selector]
	end
	return normal_icons[selector]
end


function M.setup()
	local status_ok, lualine = pcall(require, 'lualine')
	if not status_ok then
		return
	end

	local mode_color = {
		n = colors.red,
		i = colors.green,
		v = colors.blue,
		[''] = colors.blue,
		V = colors.blue,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[''] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		['r?'] = colors.cyan,
		['!'] = colors.red,
		t = colors.red,
	}

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand('%:p:h')
			local gitdir = vim.fn.finddir('.git', filepath .. ';')
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = '',
			section_separators = '',
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.fg, bg = colors.bg_dark } },
				inactive = { c = { fg = colors.fg, bg = colors.bg_dark } },
			},
			globalstatus = true,
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x at right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left {
		function()
			return '▊'
		end,
		color = function()
			-- auto change color according to neovims mode
			return { fg = mode_color[vim.fn.mode()] }
		end,

		padding = { left = 0, right = 1 }, -- We don't need space before this
	}

	ins_left {
		-- mode component
		function()
			return mode()
		end,
		color = function()
			-- auto change color according to neovims mode
			return { fg = mode_color[vim.fn.mode()] }
		end,
		padding = { right = 1 },
	}

	ins_left {
		-- filesize component
		'filesize',
		cond = conditions.buffer_not_empty,
	}

	ins_left {
		'filename',
		cond = conditions.buffer_not_empty,
		color = { fg = colors.magenta, gui = 'bold' },
	}

	ins_left { 'location' }

	ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

	ins_left {
		'diagnostics',
		sources = { 'nvim_diagnostic' },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
			info = icons.diagnostics.BoldInformation .. " "
		},
		diagnostics_color = {
			color_error = { fg = colors.red },
			color_warn = { fg = colors.yellow },
			color_info = { fg = colors.cyan },
		},
	}

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left {
		function()
			return '%='
		end,
	}

	ins_left {
		-- Lsp server name .
		function()
			local msg = 'No Lsp'
			local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = ' LSP:',
		color = { fg = colors.fg, gui = 'bold' },
	}

	-- Add components to right sections

	ins_right {
		'diff',
		-- Is it me or the symbol for modified us really weird
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " "
		},
		diff_color = {
			added = { fg = colors.gitSigns.add },
			modified = { fg = colors.gitSigns.change },
			removed = { fg = colors.gitSigns.delete },
		},
		cond = conditions.hide_in_width,
	}

	ins_right {
		'branch',
		icon = icons.git.Branch,
		color = function()
			-- auto change color according to neovims mode
			return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
		end,

	}

	ins_right {
		'o:encoding',     -- option component same as &encoding in viml
		fmt = string.upper, -- I'm not sure why it's upper case either ;)
		cond = conditions.hide_in_width,
		color = { fg = colors.yellow, gui = 'bold' },
	}

	ins_right {
		'fileformat',
		fmt = string.upper,
		icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.yellow, gui = 'bold' },
	}

	ins_right {
		function()
			return '▊'
		end,
		color = function()
			-- auto change color according to neovims mode
			return { fg = mode_color[vim.fn.mode()] }
		end,
		padding = { left = 1 },
	}

	-- Now don't forget to initialize lualine
	lualine.setup(config)
end

return M
