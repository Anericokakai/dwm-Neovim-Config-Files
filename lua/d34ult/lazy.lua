local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
	-- Auto pairs
	{
		"windwp/nvim-autopairs",
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.8",
		-- or                            , branch = '0.1.x',
		dependecies = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-ui-select.nvim",

	--- default color theme
	-- { 'projekt0n/github-nvim-theme' },

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	"nvim-treesitter/playground",
	"mbbill/undotree",

	--cmp plugins
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	----vim fugitive run git commands in vim
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- change trouble config
	{
		"folke/trouble.nvim",
		-- opts will be merged with the parent spec
		opts = { use_diagnostic_signs = true },
	},

	-- disable trouble
	--{ "folke/trouble.nvim", enabled = false },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},

	-- conform nvim
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	--snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },

		config = function()
			require("luasnip.loaders.from_vscode").lazy_load() -- Lazy load the snippets
		end,
	},
	{ "rafamadriz/friendly-snippets" },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	--Language support

	"neovim/nvim-lspconfig",
	"williamboman/nvim-lsp-installer",

	--auto close html tags
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {

			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	--- Linters
	{ "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },
	--- git signs
	"lewis6991/gitsigns.nvim",

	-- toggle Term

	--better comments in neovim
	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		"numToStr/Comment.nvim",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",

	{ "akinsho/toggleterm.nvim", version = "*" },
	-- Alpha Tree sitter
	-- magick rock installation---
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	--nvim image configuration --
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("image").setup({
				backend = "kitty",
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
			})
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		config = function()
			-- No extra config needed; defaults work well
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠤⠒⠈⠉⠉⠉⠉⠉⠉⠐⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⣠⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⡠⠞⡁⠀⠀⠀⠀⣀⣠⢠⣀⣀⣀⣤⣠⣀⡀⠀⠀⢠⣀⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⣰⠃⠀⣷⣶⡀⠀⣹⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⢿⣶⣿⣿⣤⠘⡆⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⢰⠇⠀⢠⡹⣿⣿⣿⣿⡿⠟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠑⠛⠦⣄⡀⠀⠀⠀⠀]],
				[[⠀⠀⠀⢸⠀⠀⢠⣽⡿⠟⠋⠠⠂⣀⣤⣶⣾⣿⣿⣿⣿⡿⢿⣶⣦⣄⢀⣄⡀⠀⣤⡍⠓⢦⡀⠀]],
				[[⠀⠀⠀⢸⠀⡨⢞⣁⣴⣶⣶⣶⣿⣿⣿⡿⠃⡿⢻⣿⡿⠁⠈⢻⡍⢿⣿⣝⡻⢿⣅⠀⠀⠀⠙⡄]],
				[[⠀⠀⠀⣨⠟⠁⢺⡿⢋⣾⣿⣿⣿⣿⡿⠁⢰⠃⢸⡿⠁⠀⠀⠸⡇⠀⢿⣿⣿⣦⣉⠀⠀⠀⠀⢸]],
				[[⠀⣠⠞⠁⠀⠀⠀⣠⣿⣿⣿⡿⢹⣿⠁⠀⠈⢀⡞⢀⣀⡀⠀⠀⠁⠀⠘⣿⣿⣅⣤⣄⠀⠀⢀⡞]],
				[[⢰⠃⠀⣠⣄⠀⢰⣿⣿⣿⣿⠃⢸⠷⣤⣀⣀⣈⣡⠟⢇⣁⣀⣤⣂⡀⠀⢻⣿⣿⣿⣿⠀⣠⠎⠀]],
				[[⢠⡇⠀⢰⣿⣟⠀⣾⣿⣿⣿⣿⠀⠺⠿⠿⠬⠛⠿⠋⠀⠞⠙⣿⣿⣿⡋⠀⣾⣿⣤⣿⡡⠞⠁⠀⠀]],
				[[⠈⡇⠀⢸⣿⣿⣳⢿⣿⣿⢿⡟⠀⠀⠀⠀⢀⡀⠰⠦⠀⢸⠿⠢⢍⡉⠁⢰⣳⡯⠛⠉⠀⠀⠀⠀⠀]],
				[[⠱⡀⢼⣿⣿⣯⠼⢿⡹⢯⣿⠀⠀⠀⠔⠉⠀⢀⣀⣀⣀⡀⠀⠀⠱⠀⢸⠏⠀FOR FUCK'S SAKE!]],
				[[⠀⠳⣌⡛⠛⣧⣤⣼⣏⣙⣾⣇⠀⠀⢀⠴⠊⢁⡤⡤⣤⣈⠑⠲⢄⠀⡎⠀THE TIME HE WASTES]],
				[[⠀⠀⠀⠉⠉⠁⠉⠀⠀⠀⠀⠈⠳⣤⣄⡤⠊⠁⠘⠀⠇⠛⢉⣲⠞⠋⠀IN RICING NVIM IS]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⣽⣿⣶⣾⣿⢿⡏⠀DRIVING ME CRAZY.]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⠀⠀⠈⠙⣿⣿⡼⣧⣤⡀⠀WHAT'S THE MATTER⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣶⣿⣿⣧⠀⠀⠀⠀⠈⠉⠁⠈⢙⣿⣷⣶⣤⣄⠀WITH HIM ??????]],
				[[⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⢴⣾⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀FUCKING KILL IT]],
			}
			alpha.setup(dashboard.opts)
			vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#FF6347", bg = "NONE", bold = true })
		end,
	},
}

require("lazy").setup(plugins, {})
