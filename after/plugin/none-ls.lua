
local function setup_none_ls()
  local null_ls = require("null-ls")
null_ls.setup({
    sources={
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
null_ls.builtins.diagnostics.eslint_d

        }})

vim.keymap.set("n", "<leader>gf",vim.lsp.buf.format,{})

end

setup_none_ls() 
