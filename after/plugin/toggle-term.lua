require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	auto_scroll = true,
	size = 20,
	shade_filetypes = {},
	shade_terminals = true,
	shade_factor = "1",
	start_in_insert = true,
	persist_size = true,
	direction = "float",
	insert_mappings = true,
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "none",
		},
	},
})

local terminals = {} -- Store references to terminals
local Terminal = require("toggleterm.terminal").Terminal

-- Create a new terminal and store it
vim.keymap.set("n", "<leader>tn", function()
	local term = Terminal:new({ direction = "float", float_opts = { border = "curved" } })
	table.insert(terminals, term)
	term:toggle()
end, { desc = "Open a new floating terminal" })

-- Switch to the next terminal
vim.keymap.set("n", "<leader>tt", function()
	if #terminals > 0 then
		local term = table.remove(terminals, 1) -- Get the first terminal
		table.insert(terminals, term) -- Rotate to the end of the list
		term:toggle()
	else
		print("No terminals open!")
	end
end, { desc = "Switch to the next terminal" })
