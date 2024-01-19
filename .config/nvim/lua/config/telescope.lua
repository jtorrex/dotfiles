-- Telescope
vim.cmd([[noremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>]])
vim.cmd([[noremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>]])
vim.cmd([[noremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>]])
vim.cmd([[noremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>]])
