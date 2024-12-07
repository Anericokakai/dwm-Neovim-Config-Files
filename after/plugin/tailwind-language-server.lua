local function setup_tailwind_ls()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lspconfig = require("lspconfig")

	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		settings = {
			tailwindCSS = {
				validate = true, -- Enable CSS validation for Tailwind
				classValidation = true, -- Validate Tailwind classes
				lint = {
					cssConflict = "warning", -- Show a warning if Tailwind classes conflict with CSS
				},
			},
		},
	})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
end

setup_tailwind_ls()
