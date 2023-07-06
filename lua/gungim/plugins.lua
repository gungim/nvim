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
	use("nvim-lua/popup.nvim")  -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("folke/neodev.nvim")

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	-- File explorer
	use({ "nvim-tree/nvim-tree.lua" })
	use("moll/vim-bbye")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Start window
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("ur4ltz/surround.nvim")

	-- Finder
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.1",
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use("nvim-telescope/telescope-media-files.nvim")

	-- UI
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use({ 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' })
	use("nvim-lualine/lualine.nvim")
	use('folke/tokyonight.nvim')
	use { 'folke/noice.nvim', require = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	} }
	use("oxfist/night-owl.nvim")
	use('gen740/SmoothCursor.nvim')
	use("declancm/cinnamon.nvim")
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons",  -- keep this if you're using NvChad
	})
	use('nvim-tree/nvim-web-devicons')
	use('RRethy/vim-illuminate')

	-- Completion
	use("hrsh7th/nvim-cmp")            -- The completion plugin
	use("hrsh7th/cmp-buffer")          -- buffer completions
	use("hrsh7th/cmp-path")            -- path completions
	use("hrsh7th/cmp-cmdline")         -- cmdline completions
	use("saadparwaiz1/cmp_luasnip")    -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")            --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("ziontee113/color-picker.nvim") -- color picker

	-- LSP
	use("neovim/nvim-lspconfig")          -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("lewis6991/hover.nvim")
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use('mfussenegger/nvim-dap')

	-- Formatter, Comment
	use("MunifTanjim/prettier.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim") -- Easily comment stuff

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/playground")
	use("HiPhish/nvim-ts-rainbow2")
	use("stevearc/aerial.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	--[[ use 'f-person/git-blame.nvim' ]]
	-- Test
	use({
		'xeluxee/competitest.nvim',
		requires = 'MunifTanjim/nui.nvim',
	})


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
