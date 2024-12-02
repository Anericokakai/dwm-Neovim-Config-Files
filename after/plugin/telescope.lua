local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find project  files' })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Teescope find only github files ' })

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep({
    prompt_title = "Live Grep",
    default_text = vim.fn.input("Live Grep > ")
  })
end, { desc = "Search using live grep" })
