local ok, solarized_osaka = pcall(require, "solarized-osaka")
if not ok then
	vim.notify("Failed to load solarized-osaka plugin", vim.log.levels.ERROR)
	return
end

solarized_osaka.setup({
	transparent = true,
})
vim.cmd("colorscheme solarized-osaka")

--function ColorMyPencils(color)
-- color=color or "github_dark_default"
--  vim.cmd.colorscheme(color)
-- vim.api.nvim_set_hl(0,"Normal",{bg="none"})
---- vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})

-- Set the NotifyBackground highlight to have no background (transparent)
--vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = 'none'  })  -- Optional: Set text color to white

-- Set up the notify plugin with a background color
--require("notify").setup({
-- background_colour = "#00000000",  -- Transparent background
--})

-- end

--ColorMyPencils()
