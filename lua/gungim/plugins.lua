local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin manager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Lua development
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("folke/neodev.nvim")
	-- C++ development
	use("Civitasv/cmake-tools.nvim")
	-- Vue development
	use("catgoose/vue-goto-definition.nvim")

	-- Markdown
	use("iamcco/markdown-preview.nvim")

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	-- File explorer
	use({ "nvim-tree/nvim-tree.lua", require = { "nvim-tree/nvim-web-devicons" } })
	use({"b0o/nvim-tree-preview.lua"})
	use("moll/vim-bbye")
	use("ahmedkhalf/project.nvim")

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-media-files.nvim")

	-- UI
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-lualine/lualine.nvim")
	use({ "folke/noice.nvim", requires = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	} })
	use("gen740/SmoothCursor.nvim")
	use({ "SmiteshP/nvim-navic" })
	use("RRethy/vim-illuminate")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"willothy/nvim-cokeline",
		requires = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim", -- Optional, for persistent history
		},
	})
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	})

	-- Theme
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "projekt0n/github-nvim-theme" })
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "akinsho/horizon.nvim", tag = "*" })
	use("rebelot/kanagawa.nvim")
	use("oxfist/night-owl.nvim")

	-- Coding
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	})
	-- The completion plugin
	-- use("echasnovski/mini.surround")
	use({ "echasnovski/mini.comment", requires = "JoosepAlviste/nvim-ts-context-commentstring" })
	use("ziontee113/color-picker.nvim") -- color picker
	use("NvChad/nvim-colorizer.lua")
	use({ "L3MON4D3/LuaSnip", requires = "rafamadriz/friendly-snippets", run = "make install_jsregexp" })

	-- LSP
	use("lewis6991/hover.nvim")
	use("ray-x/lsp_signature.nvim")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("jinzhongjia/LspUI.nvim")

	-- Formatter
	use("MunifTanjim/prettier.nvim")
	use({ "mhartington/formatter.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/playground")
	use("HiPhish/nvim-ts-rainbow2")
	use("stevearc/aerial.nvim")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	-- Test

	-- Todo
	use({ "folke/todo-comments.nvim", require = "nvim-lua/plenary.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
