require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ast_grep",
		"harper_ls",
		"tailwindcss",
		"css_variables",
		"cssls",
		"ts_ls",
		"eslint-lsp",
	},

	automatic_installation = true,
})

local mason_tool_installer = require("mason-tool-installer")
mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"stylua", -- lua formatter
		"isort", -- python formatter
		"black", -- python formatter
		"pylint",
		"eslint_d",
	},
})
