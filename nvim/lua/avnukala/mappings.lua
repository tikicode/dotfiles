local map = vim.keymap.set -- mappings

-- Change escape to jk
map("i", "jk", "<ESC>", options)

-- Indenting
map("n", "<M-]>", ">>", s_opts)
map("n", "<M-[>", "<<", s_opts)

-- Save key strokes so we don't need to press shift to enter command mode
map({"n", "x"}, ";", ":")

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


