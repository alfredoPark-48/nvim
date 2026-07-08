-- Project View / Backtrack to native explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Backtrack to Explorer" })

-- Open Neo-tree and reveal the current file location (IF NEO-TREE INSTALLED)
vim.keymap.set("n", "<leader>pv", "<cmd>Neotree reveal<cr>", { desc = "Backtrack to Explorer" })

-- Essential line movements & editor shortcuts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard protection
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without losing yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Clear search highlighting easily
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
