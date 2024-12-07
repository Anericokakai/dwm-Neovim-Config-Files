require("gitsigns").setup({

	signs = {
		add = { text = "+" },
		change = { text = "┋" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

local gitsign = require("gitsigns")

vim.keymap.set("n", "<leader>gp", gitsign.preview_hunk, { desc = "preview git changes" })
