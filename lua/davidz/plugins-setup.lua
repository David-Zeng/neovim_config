-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- colorschemes
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use("altercation/vim-colors-solarized") -- solarized colorscheme
	use("rebelot/kanagawa.nvim") -- kanagawa colorscheme
	use("vague2k/vague.nvim")

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use({ "stevearc/oil.nvim", requires = {
		{ "nvim-tree/nvim-web-devicons" },
	} })

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = { "kmarius/jsregexp" },
	}) -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("nvimtools/none-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	-- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- python
	use({ "jupyter-vim/jupyter-vim" }) -- jupyter-vim

	-- cody
	use({ "sourcegraph/sg.nvim", run = "nvim -l build/init.lua" })

	-- tagbar
	use({ "preservim/tagbar" })

	-- possession
	use({ "jedrzejboczar/possession.nvim" })

	-- hop
	use({
		"smoka7/hop.nvim",
		tag = "*", -- optional but strongly recommended
		-- config = function()
		-- 	-- you can configure Hop the way you like here; see :h hop-config
		-- 	require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		-- end,
	})

	-- gen plugin with ollama
	use({ "David-Kunz/gen.nvim" })

	-- gp.nvim
	use({ "robitx/gp.nvim" })

	-- avante
	use({
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
		-- "zbirenbaum/copilot.lua", -- Optional dependency for 'copilot' provider
		{
			"HakonHarnes/img-clip.nvim",
			config = function()
				require("img-clip").setup({
					-- Recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- Required for Windows users
						use_absolute_path = true,
					},
				})
			end,
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "Avante" }, -- Loads plugin for these filetypes
			config = function()
				require("render-markdown").setup({
					file_types = { "markdown", "Avante" },
				})
			end,
		},
	})
	use({
		"yetone/avante.nvim",
		run = "make", -- Runs 'make' after installation
		config = function()
			require("avante_lib").load()
			require("avante").setup({
				-- your configuration here
			})
		end,
	})

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- dadbod
	use({
		"kristijanhusak/vim-dadbod-ui",
		requires = {
			"tpope/vim-dadbod", -- Required dependency
			{
				"kristijanhusak/vim-dadbod-completion",
				ft = { "sql", "mysql", "plsql" }, -- Optional dependency for specific filetypes
			},
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		config = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	})

	-- alpha nvim dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		-- config = function()
		-- 	require("alpha").setup(require("alpha.themes.startify").config)
		-- end,
	})

	-- which-key
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})

			vim.keymap.set("n", "<leader>?", function()
				require("which-key").show({ global = false })
			end, { desc = "Buffer Local Keymaps (which-key)" })
		end,
	})

	-- markview
	use({
		"OXY2DEV/markview.nvim",
		-- Not lazy-loaded (equivalent to lazy = false in lazy.lua)
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		-- If you want to lazy-load for markdown files, uncomment the next line:
		-- ft = 'markdown'
	})

	--hardtime
	use({
		"m4xshen/hardtime.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	-- nvim-dap
	use("mfussenegger/nvim-dap-python")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
