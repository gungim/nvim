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

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	-- File explorer
	use("kyazdani42/nvim-tree.lua")
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
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Colors and theme
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	--[[ use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight ]]
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use("nvim-lualine/lualine.nvim")
	-- theme
	--	use("~/Documents/gungim_theme")
	use 'akai54/2077.nvim'
	use 'shaunsingh/nord.nvim'
	use "EdenEast/nightfox.nvim" -- Packer
	use "rayes0/blossom.vim"
	use "catppuccin/vim"
	use "lunarvim/darkplus.nvim"

	use 'gen740/SmoothCursor.nvim'
	use "declancm/cinnamon.nvim"

	-- Completion
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("alvan/vim-closetag")

	--[[ use("uga-rsa/ccc.nvim") ]]

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("lewis6991/hover.nvim")
	use("RRethy/vim-illuminate")
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
	-- Formatter
	use("MunifTanjim/prettier.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/playground")
	use("p00f/nvim-ts-rainbow")
	use("stevearc/aerial.nvim")
	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Comment
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim") -- Easily comment stuff

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	-- ssh
	use 'chipsenkbeil/distant.nvim'

	-- heler code
	use {
		'xeluxee/competitest.nvim',
		requires = 'MunifTanjim/nui.nvim',
	}

	use 'eandrju/cellular-automaton.nvim'


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
