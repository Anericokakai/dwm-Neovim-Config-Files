local function setup_html_ls()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lspconfig = require("lspconfig")

	lspconfig.html.setup({
		capabilities = capabilities,
	})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
end

setup_html_ls()
