local function setup_js_ls()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local lspconfig = require("lspconfig")

	lspconfig.ts_ls.setup({
    capabilities=capabilities})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
end

setup_js_ls()
