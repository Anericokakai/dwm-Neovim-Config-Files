local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" }) -- Win + Left Arrow for vertical split
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" }) -- Win + Down Arrow for horizontal split

--- BETTER WINDOW NAVIGATIONS
---
-- Split windows using Windows key + arrow keys
-- Navigate between windows using Windows key + arrow keys
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to the lower window" }) -- Win + j to move down
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to the upper window" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to the left window" }) -- Win + h to move left
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to the right window" }) -- Win + l to move right

-- RESIZING THE WINDOWS
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

---- END OF BETTER WINDOW NAVIGATIONS
---
---
---START OF OPENING SAVING AND CLOSING FILES

-- Example: Map <Leader>w to save the file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Example: Map <Leader>q to quit Neovim
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" })

-- Example: Map <Leader>x to save and quit
vim.keymap.set("n", "<leader>x", ":wq<CR>", { desc = "Save and Quit" })

--- Show Or Hide Hotkeys
--- -- Toggle hotkeys file
-- Toggle hotkeys file
-- Open hotkeys file with <leader>hk
vim.keymap.set("n", "<leader>hk", function()
	local hotkeys_file = vim.fn.expand("~/.config/nvim/hotkeys")
	vim.cmd("vsplit " .. hotkeys_file) -- Open the hotkeys file in a vertical split
end, { desc = "Open hotkeys file" })

--COPY PASTING USING THE CONTROLS

-- Copy selected text to clipboard with Ctrl+C
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

-- Paste from clipboard with Ctrl+V
vim.keymap.set("v", "<C-v>", '"+p', { desc = "Paste from clipboard" })

-- TOGGLING THE  WR EXPLORER
-- GO TO THE WHOLE RW EXPLORERE
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- TOGGLE THE RW EXPLORER

vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem  left<CR>", opts)

--- Move in between buffers

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)

-- escape the insert mode

vim.keymap.set("i", "jk", "<ESC>", opts)

--stay in indent mode

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- Move text up and down
-- Move selected text down and keep it active
--vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
--
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)

-- Move selected text up and keep it active
--vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
-- MOVE TEXT IN VISUAL BLOCCKMODE
--

vim.keymap.set("x", "<J>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<K>", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move  '<-2<CR>gv-gv", opts)
