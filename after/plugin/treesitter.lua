require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"javascript",
		"typescript",
		"go",
		"java",
		"tsx",
	},

	sync_install = false,
	autopairs = {
		enable = true,
	},
	auto_install = true,
	indent = { enable = true, disable = { "yaml" } },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
	enable = true,
})
