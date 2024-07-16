require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.g.mapleader = ' '
vim.keymap.set({'n','v'}, '<Space>', "<Nop>")
vim.keymap.set('n', '<C-l>', '<cmd>:bn<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>:bp<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>:tabnext<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>:tabprevious<cr>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
