vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- pasting over the new string won't discard the old one
vim.keymap.set("x", "p", [["_dP]])

-- yank to the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "Q", "<nop>")
