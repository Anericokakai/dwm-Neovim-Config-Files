local function setup_emmet_ls()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lspconfig = require("lspconfig")

	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		filetypes = { "html", "css" }, -- Supported file types
		on_attach = function(client, bufnr)
			-- Define buffer-local key mappings
			local opts = { buffer = bufnr, silent = true }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		end,
	})
end

setup_emmet_ls()
